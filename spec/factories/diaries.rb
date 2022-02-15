FactoryBot.define do
  factory :diary do
    sequence(:title) { |n| "TEST_TITLE#{n}" }
    sequence(:text) { |n| "TEST_TEXT#{n}" }
    creativity { 80 }
    word_count { 450 }
    emotion_point { 0.5 }
    sentiment_ids { [1, 2, 3] }
    association :user
  end
end
