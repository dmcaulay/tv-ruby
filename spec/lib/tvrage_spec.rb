require_relative '../../lib/tvrage'

describe TvRage do
  it "returns results from tv rage" do
    EM.run do
      tvrage = TvRage.new 'http://services.tvrage.com/feeds/'
      tvrage.request 'search.php?show=dexter' do |err, result|
        err.should be_nil
        EM.stop
      end
    end
  end
end

