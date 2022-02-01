class InsertInitialSentiments < ActiveRecord::Migration[6.0]
  def change
    sentiments = [
      "激怒", "怒り", "苛立ち",
      "警戒", "予期", "関心",
      "夢心地", "喜び", "平穏",
      "尊い", "信頼", "容認",
      "恐れ", "心配", "不安",
      "驚愕", "驚き", "動揺",
      "悲劇", "悲しみ", "感傷",
      "憎む", "嫌悪", "退屈"
    ]
    sentiments.each do |sentiment|
      Sentiment.create(name: sentiment)
    end
  end
end
