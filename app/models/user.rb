class User < ApplicationRecord
  has_many :diaries, dependent: :destroy
  has_many :soliloquies, dependent: :destroy

  authenticates_with_sorcery!
  validates :username, presence: true
  validates :email, uniqueness: true, presence: true
  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password, presence: true
end
