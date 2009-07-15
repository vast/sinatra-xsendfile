require 'sinatra_app'
require 'test/unit'
require 'rack/test'

set :environment, :test

class SinatraXSendFileTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_x_send_file
    get '/xsendfile'
    assert_not_nil last_response.headers['X-SendFile']
  end

  def test_nginx_x_accel_redirect
    get '/nginx'
    assert_not_nil last_response.headers['X-Accel-Redirect']
  end

  def test_lighty1_4_send_file
    get '/lighty1.4'
    assert_not_nil last_response.headers['X-LIGHTTPD-send-file']
  end

  def test_header_global_override
    get '/'
    assert_not_nil last_response.headers['x-test-send-file']
  end
end