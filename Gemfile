source 'https://rubygems.org'

# extensions, reporting, printing (all depend on office_clerk)
gem 'accountant_clerk' , github: "rubyclerks/accountant_clerk"

gem 'print_clerk' , github: "rubyclerks/print_clerk"
#gem 'print_clerk' , path: "../print_clerk"

gem 'post_clerk' ,  github: "rubyclerks/post_clerk"

#gem "office_clerk", github: "rubyclerks/office_clerk"
gem "office_clerk", path: "../office_clerk"

gem 'db_fixtures_dump'  , github: "dancinglightning/db_fixtures_dump" #backup

gem 'sqlite3'
gem "rails" ,  "4.1.8"

#one wishes one would not need it. alas . . .
gem 'rack-attack'

group :development do
  gem 'better_errors' , :platforms=>[:mri_20, :mri_21, :rbx]
  gem 'binding_of_caller', :platforms=>[:mri_19, :mri_20, :mri_21,:rbx]
  gem "i18n-tasks"
  gem 'quiet_assets'
  gem "thin"
  gem "rb-readline"
end

group  :production do
  gem "therubyracer" 
  gem "libv8" , "3.16.14.3"
  gem 'uglifier', '>= 1.3.0'

  gem "newrelic_rpm"
end

group :test do
#  gem "poltergeist"
#  gem "phantomjs"
  gem "codeclimate-test-reporter"
  gem 'rspec-rails'
  gem 'capybara'
  gem 'capybara-screenshot'
  gem 'database_cleaner'
  gem "factory_girl_rails"
  gem 'i18n-spec'
  gem "email_spec"
  gem 'guard'
  gem 'guard-rspec'
end
