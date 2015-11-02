source "http://rubygems.org"

# Specify your gem's dependencies in unite.gemspec
gemspec

group :test do
  gem 'SystemTimer',  :platform => :mri_18
  gem 'ruby-debug',   :platform => :mri_18
  gem 'debugger', :platform => :mri_19
  gem 'byebug', :platforms => [:mri_20, :mri_21, :mri_22]
  gem 'mocha'
  gem 'rspec'
  gem 'shoulda-matchers', :git => 'git://github.com/thoughtbot/shoulda-matchers.git', :require => 'false'
  gem 'fabrication'
  gem 'guard-rspec'
  gem 'guard-bundler'
  gem 'guard'
end
