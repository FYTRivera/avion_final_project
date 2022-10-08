class Paymongo < ApplicationRecord
    def self.paymongo
        require 'uri'
        require 'net/http'
        require 'openssl'
    
        url = URI("https://api.paymongo.com/v1/links")
    
        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true

        request = Net::HTTP::Post.new(url)
        request["accept"] = 'application/json'
        request["content-type"] = 'application/json'
        request["authorization"] = 'Basic c2tfdGVzdF9oZFNabnd6ZzFtOFFUUTlCTlB1eHI4dVE6'
        request.body = "{\"data\":{\"attributes\":{\"amount\":10000,\"description\":\"test payment\"}}}"

        response = http.request(request)
        @result = JSON.parse(response.body)

        puts result["data"]["attributes"]["status"]
    end

    def self.get_link(payment_id)
        require 'uri'
        require 'net/http'
        require 'openssl'
        require 'json'

        url = URI("https://api.paymongo.com/v1/links/#{payment_id}")

        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true

        request = Net::HTTP::Get.new(url)
        request["accept"] = 'application/json'
        request["authorization"] = 'Basic c2tfdGVzdF9oZFNabnd6ZzFtOFFUUTlCTlB1eHI4dVE6'

        response = http.request(request)
        gotten_result = JSON.parse(response.body)

        # puts gotten_result["data"]["attributes"]["status"]
    end

    def self.result
        @result
    end
end