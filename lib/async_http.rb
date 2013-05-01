require 'em-http-request'

class AsyncHttp
  def self.request(options, &callback)
    options = { url: options } if options.class == String
    connection = EventMachine::HttpRequest.new(options[:url])
    req = connection.send(options[:method] || :get, options)
    req.errback do
      callback.call(req.err || Exception.new('Generic HTTP error'))
    end
    req.callback do
      callback.call nil, req.response
    end
  end
end
