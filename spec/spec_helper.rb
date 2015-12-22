require 'bundler/setup'
Bundler.setup

require 'dhash'

RSpec.configure do |config|
   config.expect_with(:rspec) { |c| c.syntax = [:should, :expect] }
end