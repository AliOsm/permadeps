require 'better_html'
require 'flamegraph'
require 'memory_profiler'
require 'rack-mini-profiler'
require 'stackprof'

require 'bullet' if defined?(Rails) && Rails.env.development?
