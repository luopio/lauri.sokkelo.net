require 'sinatra'

post '/' do
  if params[:secret] == ENV['KEY']
    puts "---------------- Building and pulling"
    value = `./jekyll_pull_and_build.sh`
    value
  else
    puts "---------------- Key missing or wrong", params.inspect
    "Sinatra says no"
  end
end

