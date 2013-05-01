require 'xmlsimple'
require_relative 'async_http'

class TvRage
  @@cache = {}

  def initialize(baseUrl)
    @baseUrl = baseUrl
  end

  def search(show, &callback)
    request "search.php?show=#{show}" do |err, res|
      return callback.call(err) if err
      callback.call(nil, res["show"].collect { |s| { showid: s["showid"][0], name: s["name"][0].downcase } })
    end
  end

  private

  def request(path, &callback)
    url = @baseUrl + path
    return callback.call(nil, @@cache[url]) if @@cache[url]
    AsyncHttp.request url do |err, body|
      return callback.call(err) if err
      callback.call(nil, XmlSimple.xml_in(body))
    end
  end
end
