class Sentiment < ActiveHash::Base
  self.data = [
    { id: 1, name: '嬉しい' },
    { id: 2, name: '嫌悪' },
    { id: 3, name: '悲しい' },
    { id: 4, name: '恐怖' },
    { id: 5, name: '怒り' }
  ]
end
