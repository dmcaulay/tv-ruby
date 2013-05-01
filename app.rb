require 'sinatra/async'
require 'sinatra/base'
require_relative 'router/init'

class App < Sinatra::Base
  register Sinatra::Async

  configure do
    set :threaded, false
  end

  def self.get(*args, &block)
    aget(*args, &block)
  end

  Router.init(self)

end
