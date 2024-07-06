module Permadeps
  module Generators
    class InstallGenerator < ::Rails::Generators::Base
      source_root File.expand_path('templates', __dir__)

      def copy_hook_file
        copy_file '.annotaterb.yml', '.annotaterb.yml'
        copy_file '.better-html.yml', '.better-html.yml'
        copy_file '.env.example', '.env.example'
        copy_file '.erb-lint.yml', '.erb-lint.yml'
        copy_file '.rubocop.yml', '.rubocop.yml'
        copy_file 'better_html.rb', 'config/initializers/better_html.rb'
      end
    end
  end
end
