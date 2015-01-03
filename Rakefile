# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

SalesClerk::Application.load_tasks

desc 'Rebuild test and run specs'
task :full_test do
  system("rake db:drop db:migrate RAILS_ENV=test && rspec")
end

namespace :db do
  desc 'Create an admin for the shop'
  task :create_admin => :environment do
    if admin = Clerk.where(:admin => true).first
      puts "Admin alreay present #{admin.email}"
    else
      Clerk.create! :email => "admin@example.com" , :password => "password" , :password_confirmation => "password" , :admin => true
    end
  end
end

task :default => 'full_test'
