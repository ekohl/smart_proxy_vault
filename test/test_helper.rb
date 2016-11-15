require 'simplecov'
SimpleCov.start

$: << File.join(File.dirname(__FILE__), '..', 'lib')

require 'openssl'
require 'test/unit'
require "test/unit/rr"
require 'webmock/test_unit'
require 'rack/test'
require 'factory_girl'
require 'pry'
FactoryGirl.find_definitions

require 'smart_proxy_for_testing'

class Test::Unit::TestCase
  include FactoryGirl::Syntax::Methods
end

logdir = File.join(File.dirname(__FILE__), '..', 'logs')
FileUtils.mkdir_p(logdir) unless File.exists?(logdir)

WebMock.disable_net_connect!(:allow => 'codeclimate.com')
