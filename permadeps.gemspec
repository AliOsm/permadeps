# frozen_string_literal: true

require_relative 'lib/permadeps/version'

Gem::Specification.new do |spec|
  spec.name = 'permadeps'
  spec.version = Permadeps::VERSION
  spec.authors = ['Ali Hamdi Ali Fadel']
  spec.email = ['aliosm1997@gmail.com']

  spec.summary = "Ruby gem holds my permanent dependencies and configs I'm using in my Rails projects"
  spec.description = "Ruby gem holds my permanent dependencies and configs I'm using in my Rails projects"
  spec.homepage = 'https://github.com/AliOsm/permadeps'
  spec.license = 'MIT'
  spec.required_ruby_version = '>= 3.3.3'

  spec.metadata['allowed_push_host'] = 'https://rubygems.org'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/AliOsm/permadeps'
  spec.metadata['rubygems_mfa_required'] = 'true'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .github appveyor Gemfile])
    end
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  # Production dependencies:
  spec.add_dependency 'ahoy_matey', '~> 5.1'
  spec.add_dependency 'better_html', '~> 2.1', '>= 2.1.1'
  spec.add_dependency 'blazer', '~> 3.0', '>= 3.0.3'
  spec.add_dependency 'flamegraph', '~> 0.9.5'
  spec.add_dependency 'freezolite', '~> 0.5.0'
  spec.add_dependency 'geocoder', '~> 1.8', '>= 1.8.2'
  spec.add_dependency 'memory_profiler', '~> 1.0', '>= 1.0.2'
  spec.add_dependency 'notable', '~> 0.5.2'
  spec.add_dependency 'pghero', '~> 3.5'
  spec.add_dependency 'pg_query', '~> 5.1'
  spec.add_dependency 'rack-mini-profiler', '~> 3.3', '>= 3.3.1'
  spec.add_dependency 'stackprof', '~> 0.2.26'

  # Development dependencies:
  spec.add_dependency 'annotaterb', '~> 4.10'
  spec.add_dependency 'better_errors', '~> 2.10', '>= 2.10.1'
  spec.add_dependency 'binding_of_caller', '~> 1.0', '>= 1.0.1'
  spec.add_dependency 'brakeman', '~> 6.1', '>= 6.1.2'
  spec.add_dependency 'bullet', '~> 7.1', '>= 7.1.6'
  spec.add_dependency 'bundler-audit', '~> 0.9.1'
  spec.add_dependency 'dotenv', '~> 3.1', '>= 3.1.2'
  spec.add_dependency 'erb-formatter', '~> 0.7.3'
  spec.add_dependency 'erb_lint', '~> 0.5.0'
  spec.add_dependency 'i18n-tasks', '~> 1.0', '>= 1.0.14'
  spec.add_dependency 'rubocop', '~> 1.64', '>= 1.64.1'
  spec.add_dependency 'rubocop-minitest', '~> 0.35.0'
  spec.add_dependency 'rubocop-performance', '~> 1.21', '>= 1.21.1'
  spec.add_dependency 'rubocop-rails', '~> 2.25', '>= 2.25.1'
  spec.add_dependency 'rubocop-rake', '~> 0.6.0'
  spec.add_dependency 'rubocop-rspec', '~> 3.0', '>= 3.0.2'
  spec.add_dependency 'rubocop-rspec_rails', '~> 2.30'
  spec.add_dependency 'ruby_audit', '~> 2.3', '>= 2.3.1'

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
