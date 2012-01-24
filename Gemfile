source "http://rubygems.org"

gem "rake"
gem "sinatra", :require => ["sinatra/base"]
gem "activerecord", :require => ["active_record"]
gem "erubis"

platforms :ruby_18, :jruby do
  gem "require_relative"
end



group :production do
  gem "pg", :platforms => :ruby
  gem "activerecord-jdbcpostgresql-adapter", :platforms => :jruby
  gem "trinidad", :platforms => :jruby
end

group :test, :development do
  gem "sqlite3"
end

group :test do
  gem "minitest"
end


group :development do
  gem "pry"
  gem "engineyard"
  gem "rerun"
  gem "thin"
  gem "rocco", "0.7"
end

