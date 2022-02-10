FactoryBot.define do
  factory :soliloquy do
    sequence(:text) { |n| "TEST_NAME#{n}" }
    sequence(:user_id, &:to_s)
    sequence(:emotion_point, &:to_s)
  end
end
