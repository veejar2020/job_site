require 'faraday'
require 'json'

# authentication and connection to wonolo api
class Connection
  attr_accessor :token, :token_expiry
  BASE_URL = 'https://api-test.wonolo.com/api_v2'.freeze

  def initialize
    assign_token
  end

  def api
    Faraday.new(url: BASE_URL) do |faraday|
      faraday.adapter Faraday.default_adapter
      faraday.headers['Content-Type'] = 'application/json'
      faraday.params['token'] = api_token
    end
  end

  def api_token
    assign_token if Time.now > token_expiry
    @token
  end

  def assign_token
    token_details = fetch_token
    @token = token_details['token']
    @token_expiry = token_details['expires_at']
  end

  def fetch_token
    api_key = Rails.application.secrets.wonolo_key
    secret = Rails.application.secrets.wonolo_secret
    auth_url = "#{BASE_URL}/authenticate?api_key=#{api_key}" \
               "&secret_key=#{secret}"
    response = Faraday.post auth_url
    JSON.parse(response.body)
  end
end
