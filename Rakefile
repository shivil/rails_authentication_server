#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

AuthenticationServer::Application.load_tasks

unless ENV['RAILS_ENV'].to_s == 'production'

  require 'yard'
  require 'yard/rake/yardoc_task'
  require 'ci/reporter/rake/rspec'

  YARD::Rake::YardocTask.new(:yard) do |y|
    y.options = %w(--output-dir yardoc)
  end

  namespace :yardoc do
    desc 'generates yardoc files to yardoc/'
    task :generate => :yard do
      puts 'Yardoc files generated at yardoc/'
    end

    desc 'genartes and publish yardoc files to yardoc.mobme.in'
    task :publish => :generate do
      project_name = `git config remote.origin.url`.match(/(git@git.mobme.in:|git:\/\/gits.mobme.in\/)(.*).git/).captures.last.split('/').join('-')
      system "rsync -avz yardoc/ mobme@yardoc.mobme.in:/home/mobme/deploy/yardoc.mobme.in/current/#{project_name}"
      puts "Documentation published to http://yardoc.mobme.in/#{project_name}"
    end
  end

end

