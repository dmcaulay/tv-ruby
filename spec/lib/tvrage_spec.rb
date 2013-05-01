require_relative '../spec_helper'
require_relative '../../lib/tvrage'

describe TvRage do
  describe "#search" do
    it "returns results from tv rage", async: true do
      tvrage = TvRage.new 'http://services.tvrage.com/feeds/'
      tvrage.search 'dexter' do |err, results|
        err.should be_nil
        puts "received #{results}"
        done
      end
    end
  end
end

