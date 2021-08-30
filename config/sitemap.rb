# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = Setting.host

SitemapGenerator::Sitemap.create do
  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  add root_path
  add search_path
  add liked_index_path
  add new_user_session_path
  add new_user_registration_path

  Template.active.find_each do |template|
    add template_path(template), :lastmod => template.updated_at
  end

  TemplateCategory.active.find_each do |category|
    add category_path(category), :lastmod => category.updated_at
  end
end
