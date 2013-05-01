require 'em-http-request'
require 'xmlsimple'

class TvRage
  @@cache = {}

  def initialize(baseUrl)
    @baseUrl = baseUrl
  end

  def request(path, &callback)
    url = @baseUrl + path
    return callback.call(nil, @@cache[url]) if @@cache[url]
    callback.call(nil, nil)
    # request url do |err, body|
    #   return callback(err) if err
    #   callback nil, XmlSimple.xml_in(body)
    # end
  end
end
