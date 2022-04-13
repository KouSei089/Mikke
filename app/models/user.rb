class User < ApplicationRecord
  has_many :diaries, dependent: :destroy
  has_many :soliloquies, dependent: :destroy
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)(?=.*?[!-~&&[^a-z\d]])[!-~]{8,100}+\z/i.freeze

  authenticates_with_sorcery!
  validates :username, presence: true
  validates :email, uniqueness: true, presence: true
  validates :password, presence: true, format: { with: VALID_PASSWORD_REGEX, message: 'は8文字以上にしてください。英数字の両方を含む必要があります' }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :reset_password_token, uniqueness: true, allow_nil: true

  def self.demo_user
    random_value = SecureRandom.hex
    random_value_pass = rand(11_111..99_999)
    create!(
      username: Gimei.last.kanji,
      email: "demo_#{random_value}@example.com",
      password: "demou#{random_value_pass}",
      password_confirmation: "demou#{random_value_pass}"
    )
  end
end
