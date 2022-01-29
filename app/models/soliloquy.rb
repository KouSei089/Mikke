class Soliloquy < ApplicationRecord
  validates :text, presence: true

  belongs_to :user

  def sentiment_score
    require 'net/http'
    require 'uri'
    require 'json'

    text = self.text

    api_key = Rails.application.credentials.google_api[:api_key]
    uri = URI.parse("https://language.googleapis.com/v1beta1/documents:analyzeSentiment?key=#{api_key}")
    request = Net::HTTP::Post.new(uri)
    request.content_type = 'application/json'
    request.body = ''
    request.body = {
      "document": {
        "type": 'PLAIN_TEXT',
        "content": text
      }
    }.to_json

    req_options = {
      use_ssl: uri.scheme == 'https'
    }

    response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
      http.request(request)
    end

    json = JSON.parse(response.body)

    json['documentSentiment']['score']
    # 以下は後ほど使用します.
    # score =  json['documentSentiment']['score']
    # magnitude = json['documentSentiment']['magnitude']
    # json["sentences"][0]["text"]["content"]
  end
end
