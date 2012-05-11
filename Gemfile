source "http://rubygems.org"

# Specify your gem's dependencies in unity.gemspec
gemspec

group :test do
  gem 'SystemTimer',  :platform => :mri_18
  gem 'ruby-debug',   :platform => :mri_18
  gem 'linecache19',       '>= 0.5.13', :platform => :mri_19
  gem 'ruby-debug-base19', '>= 0.11.26', :platform => :mri_19
  gem 'ruby-debug19', :platform => :mri_19, :require => 'ruby-debug'
  gem 'mocha'
  gem 'rspec'
  gem 'shoulda-matchers', :git => 'git://github.com/thoughtbot/shoulda-matchers.git', :require => 'false'
  gem 'fabrication'
  gem 'guard-rspec'
  gem 'guard-bundler'
end
