###
# Compass
###

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy pages (http://middlemanapp.com/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", :locals => {
#  :which_fake_page => "Rendering a fake page with a local variable" }

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Reload the browser automatically whenever files change
# activate :livereload

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'

#set :haml, { :ugly => true, :format => :html5 }

require "active_support/inflector"

#Uncomment to regenerate apiRank

# h = Hash.new

# data.high.each do |test, _|
  
#   _.each do |county, __|
#     __.districts.each do |district, ___|
#       ___.schools.each do |school, ____|
#         if defined?(____[:api][:growth][:'2013']) && (____[:api][:growth][:'2013'] != '') then h[____[:slug]] = ____[:api][:growth][:'2013'].to_i end
#       end
#     end
#   end

#   File.open('data/apiRank.json', 'w') do |f|
#     f.puts h.sort_by { |name, score| score*-1 }.to_json
#   end
# end

# Uncomment to generate new schools TypeAhead json data file

# h = []
# g = []
# i = 0
# j = 0
# data.high.each do |test, _|
  
#   _.each do |county, __|
#     __.districts.each do |district, ___|

#       g[j] = Hash.new
#       g[j][:district] = ___[:name]
#       g[j][:'county-url'] = __[:slug] + "/" + ___[:slug]
#       j = j + 1

#       ___.schools.each do |school, ____|
#         h[i] = Hash.new
#         h[i][:school] = ____[:name]
#         h[i][:'county-url'] = __[:slug] + "/" + ___[:slug] + "/" + ____[:slug]
#         i = i + 1
#         end
#       end
#     end
#   end

# File.open('source/data/districts.json', 'w') do |f|
#     f.puts g.to_json
# end

# File.open('source/data/schools.json', 'w') do |f|
#     f.puts h.to_json
# end

# data.high.each do |test, _|
  
#   _.each do |county, __|
#     proxy "/high/#{__[:slug]}.html", "/county.html", :locals => { :master => _,:stateData => data.highstate, :county => county, :countyData => __ }, :lang => :en, :ignore => true

#     __.districts.each do |district, ___|
#       proxy "/high/#{__[:slug]}/#{___[:slug]}.html", "/district.html", :locals => { :master => _, :stateData => data.highstate, :district => district, :county => county, :countyData => __, :districtData => ___}, :lang => :en, :ignore => true

#       ___.schools.each do |school, ____|
#         proxy "/high/#{__[:slug]}/#{___[:slug]}/#{____[:slug]}.html", "/high.html", :locals => { :master => _, :stateData => data.highstate, :school => school, :district => district, :county => county, :districtData => ___, :countyData => __, :schoolData => ____, :apiRank => data.apiRank}, :lang => :en, :ignore => true
#       end
#     end
#   end
# end



# data.middle.each do |test, _|
  
#   _.each do |county, __|
#     proxy "/middle/#{__[:slug]}.html", "/county.html", :locals => { :county => county, :countyData => __ }, :lang => :en, :ignore => true

#     __.districts.each do |district, ___|
#       proxy "/middle/#{__[:slug]}/#{___[:slug]}.html", "/district.html", :locals => { :district => district, :county => county, :countyData => __, :districtData => ___}, :lang => :en, :ignore => true

#       ___.schools.each do |school, ____|
#         proxy "/middle/#{__[:slug]}/#{___[:slug]}/#{____[:slug]}.html", "/middle.html", :locals => { :school => school, :district => district, :county => county, :districtData => ___, :countyData => __, :schoolData => ____}, :lang => :en, :ignore => true
#       end
#     end
#   end
# end

# data.elementary.each do |test, _|
  
#   _.each do |county, __|
#     proxy "/elementary/#{__[:slug]}.html", "/county.html", :locals => { :county => county, :countyData => __ }, :lang => :en, :ignore => true

#     __.districts.each do |district, ___|
#       proxy "/elementary/#{__[:slug]}/#{___[:slug]}.html", "/district.html", :locals => { :district => district, :county => county, :countyData => __, :districtData => ___}, :lang => :en, :ignore => true

#       ___.schools.each do |school, ____|
#         proxy "/elementary/#{__[:slug]}/#{___[:slug]}/#{____[:slug]}.html", "/elementary.html", :locals => { :school => school, :district => district, :county => county, :districtData => ___, :countyData => __, :schoolData => ____}, :lang => :en, :ignore => true
#       end
#     end
#   end
# end


# build sitemap

sitemap = "<?xml version='1.0' encoding='UTF-8'?>\n<urlset xmlns='http://www.sitemaps.org/schemas/sitemap/0.9'>\n"
data.high.each do |test, _|  
  _.each do |county, __|
    sitemap = sitemap + "<url>\n<loc>https://www.fathoms.org/high/#{__[:slug]}</loc>\n</url>\n"
    __.districts.each do |district, ___|
      sitemap = sitemap + "<url>\n<loc>https://www.fathoms.org/high/#{__[:slug]}/#{___[:slug]}</loc>\n</url>\n"
      ___.schools.each do |school, ____|
        sitemap = sitemap + "<url>\n<loc>https://www.fathoms.org/high/#{__[:slug]}/#{___[:slug]}/#{____[:slug]}</loc>\n</url>\n"
      end
    end
  end
end

sitemap = sitemap + '</urlset>'

File.open('source/sitemap.xml', 'w') do |f|
  f.puts sitemap
end


# Build-specific configuration
configure :build do
  activate :minify_css
  activate :minify_javascript
  activate :imageoptim

  # Enable cache buster
  # activate :asset_hash

  # Use relative URLs
  # activate :relative_assets

  # Or use a different image path
  # set :http_prefix, "/Content/images/"

end
