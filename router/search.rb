
class Router::Search

  def self.init(app)
    app.aget '/search' do
      body 'no results'
    end
  end

end

