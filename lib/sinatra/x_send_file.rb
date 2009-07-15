require 'sinatra/base'
module Sinatra

  module XSendFile
    def x_send_file(path, opts = {})
      stat = File.stat(path)

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
      response[header_key] = path

      halt
    rescue Errno::ENOENT
      not_found
    end
  end

  helpers XSendFile
end