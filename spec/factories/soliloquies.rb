FactoryBot.define do
  factory :soliloquy do
    sequence(:text) { |n| "TEST_NAME#{n}" }
    sequence(:emotion_point, &:to_s)
    association :user
  end
end
