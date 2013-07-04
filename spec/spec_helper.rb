require 'simplecov'
require 'simplecov-gem-adapter'
require 'coveralls'
require 'webmock/rspec'

SimpleCov.formatter = Coveralls::SimpleCov::Formatter
SimpleCov.start 'gem'
require 'endi_feed'

RSpec.configure do |config|
  config.order = 'random'
end

def fixture(file)
  file_path = File.join(File.dirname(__FILE__), 'fixtures', "#{file}")
  File.open(file_path).read
end
