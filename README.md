#Sinatra Extension: XSendFile

`sinatra-xsendfile` extension provides `x_send_file` helper method for sending files faster

##XSendFile
* in [lighttpd](http://redmine.lighttpd.net/projects/1/wiki/X-LIGHTTPD-send-file);
* in [apache](http://tn123.ath.cx/mod_xsendfile/);
* in [nginx](http://wiki.nginx.org/NginxXSendfile).


##Example
    require 'rubygems'
    require 'sinatra'
    require 'sinatra-xsendfile'

    configure :production do
      Sinatra::Xsendfile.replace_send_file! #replaces sinatra's send_file with x_send_file
      set :xsf_header, 'X-Accel-Redirect' #setting default(X-SendFile) header (nginx)
    end

    get '/' do
      x_send_file(__FILE__)
    end

    get '/nginx' do
      x_send_file(__FILE__, :header => 'X-LIGHTTPD-send-file')
    end

    get '/sendfile' do
      send_file(__FILE__) #will work as x_send_file in production
    end
