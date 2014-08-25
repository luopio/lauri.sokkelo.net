require 'sinatra'
require 'date'

post '/' do
  puts "-------------*-* Building and pulling #{DateTime.now}"
  value = `./jekyll_pull_and_build.sh`
  value
end

