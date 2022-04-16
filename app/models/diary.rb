class Diary < ApplicationRecord
  include SentimentModule

  belongs_to :user
  has_many :diary_sentiments, dependent: :destroy
  has_many :sentiments, through: :diary_sentiments
  accepts_nested_attributes_for :diary_sentiments, allow_destroy: true

  validates :text, presence: true

  scope :self_user, ->(user) { where(user_id: user) }
  scope :order_desc, -> { order(created_at: :desc) }
  scope :sent_diary_name, -> { includes(:sentiments).order(created_at: :desc).limit(5).pluck(:name) }

  def data_create_logic
    self.creativity = text.length / 5
    self.word_count = text.length
    self.emotion_point = sentiment_score
  end
end
