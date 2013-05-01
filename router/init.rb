
class Router

  def self.init(app)
    Search.init app
  end

end

require_relative 'search'
