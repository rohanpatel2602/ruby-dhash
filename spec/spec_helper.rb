require 'bundler/setup'
Bundler.setup

require 'dhasher'

RSpec.configure do |config|
   config.expect_with(:rspec) { |c| c.syntax = [:should, :expect] }
end