require 'sinatra/base'
module Sinatra

  module XSendFile
    def x_send_file(path, opts = {})
      content_type media_type(opts[:type]) ||
              media_type(File.extname(path)) ||
              response['Content-Type'] ||
              'application/octet-stream'

      if opts[:disposition] == 'attachment' || opts[:filename]
        attachment opts[:filename] || path
      elsif opts[:disposition] == 'inline'
        response['Content-Disposition'] = 'inline'
      end

      header_key = opts[:header] || (Sinatra::Application.respond_to?(:xsf_header) && Sinatra::Application.xsf_header) ||
                                    'X-SendFile'
      path = File.expand_path(path).gsub(Sinatra::Application.public, '') if header_key == 'X-Accel-Redirect'

      response[header_key] = path

      halt
    rescue Errno::ENOENT
      not_found
    end

    def self.replace_send_file!
      Sinatra::Helpers.send(:alias_method, :old_send_file, :send_file)
      Sinatra::Helpers.module_eval("def send_file(path, opts={}); x_send_file(path, opts); end;")
    end
  end

  helpers XSendFile
end