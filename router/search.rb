require_relative '../lib/tvrage'

class Router::Search
  @@tvrage = TvRage.new 'http://services.tvrage.com/feeds/'

  def self.init(app)

    app.get '/search' do
      @@tvrage.search params[:q] do |err, results|
        return body "Error: #{err}" if err
        body "#{results}"
      end
    end

  end

end

