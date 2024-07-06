# permadeps

Ruby gem holds my permanent dependencies and configs I'm using in my Rails projects.

This gem is compatible with [this](https://github.com/AliOsm/ruby-on-rails-devcontainer) DevContainer setup.

## Installation

Install the gem and add it to the Rails application's Gemfile by executing:

```bash
$ bundle add permadeps
```

## Usage

Adding this gem to your Rails project will provide you with the following gems:

### Production dependencies:
- [`ahoy_matey`](https://github.com/ankane/ahoy) (Will be required)
- [`better_html`](https://github.com/Shopify/better-html) (Will be required)
- [`blazer`](https://github.com/ankane/blazer) (Will be required)
- [`flamegraph`](https://github.com/SamSaffron/flamegraph) (Will be required)
- [`freezolite`](https://github.com/ruby-next/freezolite)
- [`geocoder`](https://github.com/alexreisner/geocoder)
- [`memory_profiler`](https://github.com/SamSaffron/memory_profiler) (Will be required)
- [`notable`](https://github.com/ankane/notable) (Will be required)
- [`pghero`](https://github.com/ankane/pghero) (Will be required)
- [`pg_query`](https://github.com/pganalyze/pg_query)
- [`rack-mini-profiler`](https://github.com/MiniProfiler/rack-mini-profiler) (Will be required)
- [`stackprof`](https://github.com/tmm1/stackprof) (Will be required)

### Development dependencies:
- [`annotaterb`](https://github.com/drwl/annotaterb)
- [`better_errors`](https://github.com/BetterErrors/better_errors)
- [`binding_of_caller`](https://github.com/banister/binding_of_caller)
- [`brakeman`](https://github.com/presidentbeef/brakeman)
- [`bullet`](https://github.com/flyerhzm/bullet) (Will be required in development environment only)
- [`bundler-audit`](https://github.com/rubysec/bundler-audit)
- [`dotenv`](https://github.com/bkeepers/dotenv)
- [`erb-formatter`](https://github.com/nebulab/erb-formatter)
- [`erb_lint`](https://github.com/Shopify/erb-lint)
- [`i18n-tasks`](https://github.com/glebm/i18n-tasks)
- [`rubocop`](https://github.com/rubocop/rubocop)
- [`rubocop-minitest`](https://github.com/rubocop/rubocop-minitest)
- [`rubocop-performance`](https://github.com/rubocop/rubocop-performance)
- [`rubocop-rails`](https://github.com/rubocop/rubocop-rails)
- [`rubocop-rake`](https://github.com/rubocop/rubocop-rake)
- [`rubocop-rspec`](https://github.com/rubocop/rubocop-rspec)
- [`rubocop-rspec_rails`](https://github.com/rubocop/rubocop-rspec_rails)
- [`ruby_audit`](https://github.com/civisanalytics/ruby_audit)

#### Rubocop

For `rubocop` gem, use the following configuration file to inherit from `permadeps` gem:

```yml
inherit_gem:
  permadeps:
    - rubocop.yml
```

#### Formatters

`erb-formatter` and `erb_lint` requires the following VSCode extensions to work properly:
- [Ruby ERB::Formatter](https://marketplace.visualstudio.com/items?itemName=elia.erb-formatter)
- [ERB Linter](https://marketplace.visualstudio.com/items?itemName=manuelpuyol.erb-linter)

Make sure to setup the other gems properly in your Rails application.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
