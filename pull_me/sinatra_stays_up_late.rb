require 'sinatra'

post '/' do
  puts "---------------- Building and pulling"
  value = `./jekyll_pull_and_build.sh`
  value
end

