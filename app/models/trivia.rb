class Trivia < ActiveHash::Base
  self.data = [
    { id: 1, title: 'エビデンス',
      description: 'エビデンス（evidence）とは、「証拠」「根拠」「裏付け」「形跡」といった意味を持つ言葉です。 情報や主張に対する正確性や客観性を担保するには、エビデンスが欠かせません。 ITや医療、金融・不動産業界など、さまざまな分野で使用される言葉ですが、業界ごとにそれぞれ違った意味で使われています' },
    { id: 2, title: 'エクスプレッシブ・ライティング',
      description: '日本語では「筆記開示」とも呼ばれており、考えていることを書いて言語化するというテクニックを指しています。 やり方は1日20分、自分の感じている悩みや不安を紙に書き出すこと。 紙とペンさえあればすぐに実行できます。' },
    { id: 3, title: 'ジャーナリング',
      description: '「自分が本当にやりたいことは一体何なのか」「自分がどのように考えているのか」といったことが分からなくなるときはありませんか。このように、忙しくて心が疲れている人や複雑な気持ちを抱えている人、自分のことをもっと知りたい人におすすめするのが、ジャーナリングという習慣です。' }
  ]
end
