class Write < ActiveHash::Base
  self.data = [
    { id: 1, title: '書く内容' },
    { id: 2, title: '書く実行' },
    { id: 3, title: '書く提供' }
  ]
end
