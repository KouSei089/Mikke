class Sentiment < ActiveHash::Base
  include ActiveHash::Associations
  has_many :diary_sentiments, dependent: :destroy

  def diaries
    diary_sentiments.map(&:diary)
  end

  self.data = [
    { id: 1, name: '嬉しい' },
    { id: 2, name: '嫌悪' },
    { id: 3, name: '悲しい' },
    { id: 4, name: '恐怖' },
    { id: 5, name: '怒り' }
  ]
end
