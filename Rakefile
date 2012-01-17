require "rake/testtask"

RUN_COMMAND = "bin/rackup"

Rake::TestTask.new do |t|
    t.test_files = FileList['test/**/*.rb']
end

task :docs do
  system "bin/rocco app.rb models/*.rb -o docs"
end

task :run do
  system RUN_COMMAND
end

task :rerun do
  system "bin/rerun #{RUN_COMMAND}"
end

namespace :rerun do
  task :test do
    system "bin/rerun rake test"
  end
end

task :pry do
  require "pry"
  require "./app"
  Todo.pry
end

task :default => :test

