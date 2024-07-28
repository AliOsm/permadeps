module Permadeps
  module Generators
    class InstallGenerator < ::Rails::Generators::Base
      source_root File.expand_path('templates', __dir__)

      def copy_config_files
        copy_file '.annotaterb.yml', '.annotaterb.yml'
        copy_file '.better-html.yml', '.better-html.yml'
        copy_file '.env.example', '.env.example'
        copy_file '.erb-lint.yml', '.erb-lint.yml'
        copy_file '.rubocop.yml', '.rubocop.yml'
      end

      def copy_initializers
        copy_file 'initializers/better_html.rb', 'config/initializers/better_html.rb'
        copy_file 'initializers/blazer.rb', 'config/initializers/blazer.rb'
        copy_file 'initializers/rack_mini_profiler.rb', 'config/initializers/rack_mini_profiler.rb'
        copy_file 'initializers/rails_performance.rb', 'config/initializers/rails_performance.rb'
      end

      def copy_jobs
        copy_file 'jobs/capture_query_stats_job.rb', 'app/jobs/capture_query_stats_job.rb'
        copy_file 'jobs/capture_space_stats_job.rb', 'app/jobs/capture_space_stats_job.rb'
        copy_file 'jobs/clean_query_stats_job.rb', 'app/jobs/clean_query_stats_job.rb'
        copy_file 'jobs/clean_space_stats_job.rb', 'app/jobs/clean_space_stats_job.rb'
      end

      def copy_tasks
        copy_file 'tasks/annotate_rb.rake', 'lib/tasks/annotate_rb.rake'
      end

      def run_generators
        generate 'ahoy:install'
        generate 'blazer:install'
        generate 'bullet:install'
        generate 'good_job:install'
        generate 'notable:requests'
        generate 'notable:jobs'
        generate 'pghero:query_stats'
        generate 'pghero:space_stats'
      end

      def setup_good_job # rubocop:disable Metrics/MethodLength
        append_to_file 'Procfile.dev', "worker: bundle exec good_job start\n"

        gsub_file(
          'config/environments/production.rb',
          '# config.active_job.queue_adapter = :resque',
          'config.active_job.queue_adapter = :good_job'
        )

        insert_into_file 'config/environments/production.rb', before: /^end/ do
          <<-RUBY

  config.good_job.enable_cron = true

  config.good_job.cron = {
    capture_space_stats: {
      cron: '*/5 * * * *',
      class: 'CaptureSpaceStatsJob',
      description: 'Capture PgHero space statistics every 5 minutes'
    },
    clean_space_stats: {
      cron: '0 0 * * 5',
      class: 'CleanSpaceStatsJob',
      description: 'Clean PgHero space statistics every Friday midnight'
    },
    capture_query_stats: {
      cron: '*/5 * * * *',
      class: 'CaptureQueryStatsJob',
      description: 'Capture PgHero query statistics every 5 minutes'
    },
    clean_query_stats: {
      cron: '0 0 * * 5',
      class: 'CleanQueryStatsJob',
      description: 'Clean PgHero query statistics every Friday midnight'
    }
  }
          RUBY
        end
      end

      def setup_freezolite_gem
        insert_into_file(
          'config/application.rb',
          "\n\nrequire 'freezolite/auto'",
          after: 'Bundler.require(*Rails.groups)'
        )
      end

      def insert_engines
        insert_into_file 'config/routes.rb', before: /^end/ do
          <<-RUBY

  authenticate :user, ->(user) { user.admin? } do
    mount Blazer::Engine, at: 'rails/blazer'
    mount GoodJob::Engine, at: 'rails/good_job'
    mount PgHero::Engine, at: 'rails/pghero'
    mount RailsPerformance::Engine, at: 'rails/performance'
  end
          RUBY
        end
      end

      def run_migrations
        rails_command 'db:migrate'
      end
    end
  end
end
