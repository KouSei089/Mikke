class Sentiment < ApplicationRecord
  has_many :diary_sentiments, dependent: :destroy
  has_many :diaries, through: :diary_sentiments
end
