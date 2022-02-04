module ApplicationHelper
  def embedded_svg(filename, options = {})
    file = File.read(Rails.root.join('app', 'assets', 'images', filename))
    doc = Nokogiri::HTML::DocumentFragment.parse file
    svg = doc.at_css 'svg'
    svg['class'] = options[:class] if options[:class].present?
    content_tag(doc.to_html)
  end

  def page_title(page_title = '')
    base_title = 'Mikke'
    page_title.empty? ? base_title : "#{page_title} | #{base_title}"
  end
end
