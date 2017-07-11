$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "ggm_domain"
require "timecop"
require 'simplecov'
require 'simplecov-rcov'
SimpleCov.formatter = SimpleCov::Formatter::RcovFormatter
SimpleCov.start do
  add_filter '/vendor/'
end