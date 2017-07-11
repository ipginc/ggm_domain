$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "ggm_domain"
require "timecop"
require 'simplecov'
require 'simplecov-json'
require 'simplecov-rcov'
SimpleCov.formatters = [
    SimpleCov::Formatter::HTMLFormatter,
    SimpleCov::Formatter::JSONFormatter,
    SimpleCov::Formatter::RcovFormatter
]
SimpleCov.start do
  add_filter '/vendor/'
end