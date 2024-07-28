require 'ahoy'
require 'blazer'
require 'better_html'
require 'flamegraph'
require 'geocoder'
require 'good_job'
require 'memory_profiler'
require 'notable'
require 'pghero'
require 'rack-mini-profiler'
require 'rails_performance'
require 'stackprof'

require 'bullet' if defined?(Rails) && Rails.env.development? && Rails.gem_version < Gem::Version.new('8.0.0.alpha')
