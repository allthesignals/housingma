source 'https://rubygems.org'

gem 'rails', '3.2.13'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'pg'
gem 'activerecord-postgis-adapter'

gem 'rgeo'
gem 'rgeo-geojson'


#    app server
gem 'unicorn' 
gem 'foreman'

#    Render HAML content for narratives
gem 'haml'

#    Export Word files
gem 'docx_replace'

#    Autocomplete
gem 'twitter-typeahead-rails'   
gem 'bootstrap-typeahead-rails'

#      For user management of plan
# gem 'devise'
# gem 'rails_admin'
# gem 'cancan'

# TODO: Consider adding machine-readability
# gem 'rabl' # RABL templates for JSON
# gem 'oj'


group :development do
  gem 'capistrano',      '~> 2.0'
  gem 'net-ssh',         '2.7.0'
  gem 'net-ssh-gateway', '1.2.0'
  gem 'capistrano-unicorn', :require => false
end

group :development, :test do
  gem 'progress_bar'

  gem 'rspec-rails'
  gem 'capybara', '1.1.2'
  gem 'launchy'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'



