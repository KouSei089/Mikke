class Soliloquy < ApplicationRecord
  include SentimentModule

  belongs_to :user

  validates :text, presence: true
end
