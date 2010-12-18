require 'rubygems'
require 'sinatra'
require 'lib/sinatra-xsendfile'


set :xsf_header, 'x-test-send-file'

Sinatra::Xsendfile.replace_send_file!

get '/' do
  x_send_file(__FILE__)
end

get '/nginx' do
  x_send_file(__FILE__, :header => 'X-Accel-Redirect')
end

get '/lighty1.4' do
  x_send_file(__FILE__, :header => 'X-LIGHTTPD-send-file')
end

get '/xsendfile' do
  x_send_file(__FILE__, :header => 'X-SendFile')
end

get '/sendfile' do
  send_file(__FILE__)
end