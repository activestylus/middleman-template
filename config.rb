set :frontmatter_extensions, %w(.html .slim .erb)
set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'
helpers do
  def site ; data.site ; end
  def cpdata ; current_page.data ; end
  def active_if(klass)
    cpdata.klass == klass ? "active" : nil
  end
  def nav_link txt, section
    link_to txt, "/#{section}", class: active_if(section), id: "nav_#{section}"
  end
  def bgi(url)
    "background-image: url('#{url}')"
  end
  
  def bodyclass
    "#{page_classes} #{current_page.data.klass}"
  end
  def page_is(str)
    cpdata.klass == str
  end
end
activate :directory_indexes
configure :build do
  activate :minify_css
  activate :minify_javascript
  activate :asset_hash
  activate :relative_assets
end
# activate :automatic_image_sizes
# configure :development do
#   activate :livereload
# end
# page "/index.html", :layout => false
# compass_config do |config|
#   config.output_style = :compact
# end