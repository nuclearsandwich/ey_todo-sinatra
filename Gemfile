source "http://rubygems.org"

gem "rake"
gem "sinatra", :require => ["sinatra/base"]
gem "activerecord", :require => ["active_record"]
gem "erubis"

group :test do
  gem "minitest"
end

group :test, :development do
  gem "sqlite3"
end

group :production do
  gem "pg"
end

group :development do
  gem "pry"
  gem "ey"
  gem "rerun"
  gem "thin"
  gem "rocco", "0.7"
end
