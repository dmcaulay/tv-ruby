require 'sinatra/async'
require 'sinatra/base'
require_relative 'router/init'

class App < Sinatra::Base
  register Sinatra::Async

  configure do
    set :threaded, false
  end

  Router.init(self)

end
