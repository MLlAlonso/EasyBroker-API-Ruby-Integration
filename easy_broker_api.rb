require 'net/http'
require 'json'

class EasyBrokerAPI
  BASE_URL = 'https://api.stagingeb.com/v1'
  API_KEY = 'tu_api_key_aquí'

  def initialize
    @uri = URI("#{BASE_URL}/properties")
  end

  def fetch_properties
    request = Net::HTTP::Get.new(@uri)
    request['X-Authorization'] = API_KEY

    response = Net::HTTP.start(@uri.host, @uri.port, use_ssl: true) do |http|
      http.request(request)
    end

    JSON.parse(response.body)['content']
  end

  def print_titles
    properties = fetch_properties
    properties.each { |property| puts property['title'] }
  end
end
