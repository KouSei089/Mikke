class Diary < ApplicationRecord
  include SentimentModule

  belongs_to :user
  has_many :diary_sentiments, dependent: :destroy
  has_many :sentiments, through: :diary_sentiments
  accepts_nested_attributes_for :diary_sentiments, allow_destroy: true

  validates :text, presence: true
  # validates :sentiment_ids, presence: true

  def data_create_logic
    self.creativity = text.length / 5
    self.word_count = text.length
    self.emotion_point = sentiment_score
  end
end
