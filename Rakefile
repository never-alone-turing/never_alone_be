# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require 'graphql/rake_task'

require_relative 'config/application'

Rails.application.load_tasks
Rake::Task["default"].clear

task :default do
  Rake::Task["assets:precompile"].invoke
end
