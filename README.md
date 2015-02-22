# Sinatra Extension: XSendFile

`sinatra-xsendfile` extension provides `x_send_file` helper method for sending files faster

_NOTE_: `sinatra-xsendfile` is no longer supported. Consider using [Rack::Sendfile](https://github.com/rack/rack/blob/master/lib/rack/sendfile.rb) instead.


##XSendFile
* in [lighttpd](http://redmine.lighttpd.net/projects/1/wiki/X-LIGHTTPD-send-file);
* in [apache](http://tn123.ath.cx/mod_xsendfile/);
* in [nginx](http://wiki.nginx.org/NginxXSendfile).


##Installation

If you use [bundler](http://gembundler.com/), simply specify
`sinatra-xsendfile` as a dependency in a Gemfile in your project's root:

```ruby
gem 'sinatra-xsendfile'
```

and run `bundle install`.

Otherwise install the gem as usual:

```bash
[sudo] gem install sinatra-xsendfile
```

##Example

```ruby
require 'rubygems'
require 'sinatra'
require 'sinatra/xsendfile'

configure :production do
  Sinatra::Xsendfile.replace_send_file! # replace Sinatra's send_file with x_send_file
  set :xsf_header, 'X-Accel-Redirect' # set x_send_file header (default: X-SendFile)
end

get '/' do
  x_send_file(__FILE__)
end

get '/lighttpd' do
  x_send_file(__FILE__, header: 'X-LIGHTTPD-send-file') # custom header
end

get '/sendfile' do
  send_file(__FILE__) # will work as x_send_file in production (see configure block)
end
```

*Note* that if your application subclasses `Sinatra::Base` (modular app),
you have to register the extension in your subclass:

```ruby
helpers Sinatra::Xsendfile
```
