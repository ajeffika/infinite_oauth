module RequestHelper
  require 'net/http'

  def make_request(url)
    uri = URI.parse(url)
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Get.new(uri.request_uri)
    http.use_ssl = true
    response = http.request(request)
    JSON.parse(response.body)
  end
end