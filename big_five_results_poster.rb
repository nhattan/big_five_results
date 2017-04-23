require "net/http"
require "json"

class BigFiveResultsPoster
  attr_accessor :body, :response_code, :token

  ENDPOINT = "https://recruitbot.trikeapps.com/api/v1/roles/mid-senior-web-developer/big_five_profile_submissions"

  def initialize(body)
    @body = body
  end

  def post
    uri = URI(ENDPOINT)

    uri = URI.parse(ENDPOINT)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    request = Net::HTTP::Post.new(uri.path, "Content-Type" => "application/json")
    request.body = body.to_json

    response = http.request(request)

    response_code = response.code

    if response_code == 201
      token = response.body
      true
    else
      puts response.body
      false
    end
  end
end
