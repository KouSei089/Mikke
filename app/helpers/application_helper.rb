module ApplicationHelper
  def embedded_svg(filename, options = {})
    file = File.read(Rails.root.join('app', 'assets', 'images', filename))
    doc = Nokogiri::HTML::DocumentFragment.parse file
    svg = doc.at_css 'svg'
    svg['class'] = options[:class] if options[:class].present?
    content_tag(doc.to_html)
  end

  def default_meta_tags
    {
      site: 'Mikke（ミッケ）習慣ジャーナリング',
      title: 'Mikke（ミッケ）習慣ジャーナリング',
      reverse: true,
      separator: '|',
      description: 'Mikke（ミッケ）習慣ジャーナリング 書く瞑想で、新しい自分が見つかる。 ジャーナリングとは、頭に浮かぶ思考をありのまま書き出すということです。書く瞑想とも呼ばれています。Mikke（ミッケ）では、ジャーナリングをデジタルで実現し、感情の分析や習慣化しやすいようにサポートするサービスです。',
      keywords: 'キーワード',
      canonical: request.original_url,
      noindex: !Rails.env.production?,
      icon: [
        { href: image_url('favicon.png') },
        { href: image_url('logo.png'), rel: 'phone-icon', sizes: '180x180', type: 'image/jpg' }
      ],
      og: {
        site_name: 'Mikke（ミッケ）習慣ジャーナリング',
        title: 'Mikke（ミッケ）習慣ジャーナリング',
        description: 'ディスクリプション',
        type: 'website',
        # url: request.original_url,
        image: image_url('logo.png'),
        locale: 'ja_JP'
      }
      # twitter: {
      #   card: 'summary_large_image',
      #   site: '@ツイッターのアカウント名',
      # }
    }
  end
end
