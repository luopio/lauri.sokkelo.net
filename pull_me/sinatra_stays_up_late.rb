require 'sinatra'
require 'date'
require 'json'
require 'pp'

post '/' do
  request.body.rewind
  payload = JSON.parse request.body.read
  # project = params[:project]
  # branch = params[:branch]
  # id = params[:id]
  puts "------------"
  pp(payload)
  puts "------------"
  project = payload['repository']['name']
  branch = payload['head'].split('/').last
  id = payload['head']
  puts "-/-/-/-|-\\-\\-\\- Building #{project}/#{branch}/#{id} on #{DateTime.now}"
  puts handle_projects(project, branch, id)
  puts
end

def handle_projects(project, branch, id)
  case project
    when 'lauri.sokkelo.net'
      `./jekyll_pull_and_build.sh /var/www/lauri`

    when 'koulunhyvinvointiprofiili'
      build_out = `./build_kh.sh #{branch} #{id} /home/lauri/builder/kh`
      build_out + `./deploy_kh.sh #{branch} #{id} localhost`

    when 'www.montell.fi'
      `./jekyll_pull_and_build.sh /var/www/montell`

    else
      return "Dunno how to handle #{project}"
  end
end

