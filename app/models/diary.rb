class Diary < ApplicationRecord
  belongs_to :user

  has_many :diary_sentiments, dependent: :destroy
  has_many :sentiments, through: :diary_sentiments
  accepts_nested_attributes_for :diary_sentiments, allow_destroy: true

  validates :text, presence: true
  validates :sentiment_ids, presence: true

  def data_create_logic
    self.creativity = text.length / 5
    self.word_count = text.length
    self.emotion_point = sentiment_score
  end

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
