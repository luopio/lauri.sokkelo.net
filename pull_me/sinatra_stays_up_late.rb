require 'sinatra'

post '/' do
    if params[:key] == ENV['KEY']
        value = `./jekyll_pull_and_build.sh`
        value
    else
        "Sinatra says no"
    end
end

