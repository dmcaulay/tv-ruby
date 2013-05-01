require 'eventmachine'
require 'rack'

require_relative 'app'

EM.run do

  app = App.new

  dispatch = Rack::Builder.app do
    map '/' do
      run app
    end
  end

  Rack::Server.start({ app: dispatch, server: 'thin', Host: '0.0.0.0', Port: 8181 })

end
