class InsertInitialSentiments < ActiveRecord::Migration[6.0]
  def change
    sentiments = ["嬉しい", "楽しい", "悲しい", "怒り", "恐怖"]
    sentiments.each do |sentiment|
      Sentiment.create(name: sentiment)
    end
  end
end
