# permadeps

Ruby gem that holds permanent dependencies and configurations for Rails projects.

This gem is compatible with [this Ruby on Rails DevContainer setup](https://github.com/AliOsm/ruby-on-rails-devcontainer).

## Installation

Add the gem to your Rails application's Gemfile by executing:

```bash
$ bundle add permadeps
```

## Usage

Adding this gem to your Rails project provides you with the following gems and features:

### Production Dependencies

The following gems will be automatically required:

- [`ahoy_matey`](https://github.com/ankane/ahoy): Analytics for Rails
- [`better_html`](https://github.com/Shopify/better-html): Better HTML for Rails
- [`blazer`](https://github.com/ankane/blazer): Business intelligence made simple
- [`flamegraph`](https://github.com/SamSaffron/flamegraph): Flamegraph profiler
- [`geocoder`](https://github.com/alexreisner/geocoder): Geocoding solution
- [`memory_profiler`](https://github.com/SamSaffron/memory_profiler): Memory profiling tool
- [`notable`](https://github.com/ankane/notable): Automatic tracking for requests and background jobs
- [`pghero`](https://github.com/ankane/pghero): PostgreSQL insights
- [`rack-mini-profiler`](https://github.com/MiniProfiler/rack-mini-profiler): Profiler for Rack applications
- [`stackprof`](https://github.com/tmm1/stackprof): Sampling call-stack profiler

Additional production dependencies (not automatically required):

- [`freezolite`](https://github.com/ruby-next/freezolite): Automatic string freezing
- [`pg_query`](https://github.com/pganalyze/pg_query): PostgreSQL query parsing

### Development Dependencies

- [`annotaterb`](https://github.com/drwl/annotaterb): Annotate Rails models
- [`better_errors`](https://github.com/BetterErrors/better_errors): Better error page for Rails
- [`binding_of_caller`](https://github.com/banister/binding_of_caller): Retrieve the binding of a method's caller
- [`brakeman`](https://github.com/presidentbeef/brakeman): Security vulnerability scanner
- [`bullet`](https://github.com/flyerhzm/bullet): Help to kill N+1 queries (automatically required in development)
- [`bundler-audit`](https://github.com/rubysec/bundler-audit): Patch-level verification for Bundler
- [`dotenv`](https://github.com/bkeepers/dotenv): Load environment variables from `.env`
- [`erb-formatter`](https://github.com/nebulab/erb-formatter): ERB formatter
- [`erb_lint`](https://github.com/Shopify/erb-lint): ERB linter
- [`i18n-tasks`](https://github.com/glebm/i18n-tasks): Manage translation and localization
- [`rubocop`](https://github.com/rubocop/rubocop) and related gems: Ruby static code analyzer and formatter

## Configuration

### Rubocop

To use the `rubocop` configuration provided by `permadeps`, add the following to your `.rubocop.yml`:

```yml
inherit_gem:
  permadeps:
    - rubocop.yml
```

### Formatters

For `erb-formatter` and `erb_lint` to work properly in VSCode, install these extensions:
- [Ruby ERB::Formatter](https://marketplace.visualstudio.com/items?itemName=elia.erb-formatter)
- [ERB Linter](https://marketplace.visualstudio.com/items?itemName=manuelpuyol.erb-linter)

## Generator

The gem provides a generator to install necessary files and configurations:

```bash
$ rails g permadeps:install
```

This generator will perform the following actions:

1. Copy configuration files:
  - `.annotaterb.yml`: Configuration for AnnotateRb
  - `.better-html.yml`: Configuration for Better HTML
  - `.env.example`: Example environment variables file
  - `.erb-lint.yml`: Configuration for ERB Lint
  - `.rubocop.yml`: Configuration for RuboCop

2. Copy initializers:
  - `config/initializers/better_html.rb`: Sets up Better HTML
  - `config/initializers/blazer.rb`: Configures Blazer
  - `config/initializers/rack_mini_profiler.rb`: Sets up Rack Mini Profiler

3. Add background jobs for PgHero:
  - `app/jobs/capture_query_stats_job.rb`: Captures query statistics
  - `app/jobs/capture_space_stats_job.rb`: Captures space usage statistics
  - `app/jobs/clean_query_stats_job.rb`: Cleans up old query statistics
  - `app/jobs/clean_space_stats_job.rb`: Cleans up old space usage statistics

4. Add a rake task:
  - `lib/tasks/annotate_rb.rake`: Task for running Annotate

5. Run generators for various gems:
  - `ahoy:install`: Sets up Ahoy for analytics
  - `blazer:install`: Installs Blazer for business intelligence
  - `notable:requests`: Sets up Notable for request tracking
  - `notable:jobs`: Sets up Notable for job tracking
  - `pghero:query_stats`: Installs PgHero query stats
  - `pghero:space_stats`: Installs PgHero space stats

6. Set up Freezolite:
  - Adds `require 'freezolite/auto'` to `config/application.rb` for automatic string freezing

7. Run database migrations:
  - Executes `rails db:migrate` to apply all pending migrations

After running the generator, your Rails application will be configured with all the necessary settings and files to use the gems provided by permadeps. Make sure to review the generated files and adjust them as needed for your specific project requirements.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
