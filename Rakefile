require "rake/testtask"

Rake::TestTask.new do |t|
    t.test_files = FileList['test/**/*.rb']
end

task :docs do
  system "bin/rocco app.rb models/*.rb -o docs"
end

task :run do
  system "bin/rackup"
end

task :default => :test

