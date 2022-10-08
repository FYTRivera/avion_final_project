require 'uri'
require 'net/http'
require 'openssl'
require 'json'

url = URI("https://api.paymongo.com/v1/links/W8PB2cJ")

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true

request = Net::HTTP::Get.new(url)
request["accept"] = 'application/json'
request["authorization"] = 'Basic c2tfdGVzdF9oZFNabnd6ZzFtOFFUUTlCTlB1eHI4dVE6'

response = http.request(request)
result = JSON.parse(response.body)

puts result["data"]["attributes"]["status"]