source 'https://rubygems.org'

# extensions, reporting, printing (all depend on office_clerk)
gem 'accountant_clerk' , github: "rubyclerks/accountant_clerk"
gem 'print_clerk' , github: "rubyclerks/print_clerk"
gem 'post_clerk' ,  github: "rubyclerks/post_clerk"
gem "office_clerk", path: "../office_clerk"

#misc
gem "valid_email" , :require => 'valid_email/email_validator' #no mx checking
gem 'db_fixtures_dump' , :github => 'rubyclerks/db_fixtures_dump' #backup

gem "ransack", github: "activerecord-hackery/ransack", branch: "rails-4"

gem 'sqlite3'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end


#one wishes one would not need it. alas . . .
gem 'rack-attack'

group :development do
  gem 'better_errors' , :platforms=>[:mri_20, :mri_21, :rbx]
  gem 'binding_of_caller', :platforms=>[:mri_19, :mri_20, :mri_21,:rbx]
  gem "i18n-tasks"
  gem 'quiet_assets'
  gem 'rails_layout'
#  gem "jeweler", "> 1.6.4"
end

#asset / production reelated
gem "therubyracer" 
gem "libv8" , "3.16.14.3"
gem "rb-readline"
gem 'uglifier', '>= 1.3.0'


group :test do
#  gem "poltergeist"
#  gem "phantomjs"
  gem "codeclimate-test-reporter"
  gem 'rspec-rails'
  gem 'capybara'
  gem 'capybara-screenshot'
  gem 'database_cleaner'
  gem "factory_girl_rails"
  gem 'email_spec'
  gem 'i18n-spec'
  gem 'guard-bundler'
  gem 'guard-rails'
  gem 'guard-rspec'
end
