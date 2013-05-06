require 'sinatra'
require 'json'

use Rack::Auth::Basic, "Restricted" do |username, password|
  username == ENV['BASIC_USERNAME'] and password == ENV['BASIC_PASSWORD']
end

class GithubTwitter

  def initialize(payload)
    payload = JSON.parse(payload)
    p payload
    return unless payload.keys.include?("repository")
    return unless payload["ref"].include?("tags")
    repo = payload["repository"]["name"]
    payload['tag'] = payload["ref"][10..-1]
    proc = Proc.new do
      payload
    end

    template = ERB.new("New [<%= payload['repository']['name'] %>] tag: <%= payload['tag'] %> - <%= payload['repository']['url'] %>")
    connect(repo).post(template.result(proc))
  end

  def connect(repo)
    return Twitter::Base.new(ENV['TWITTER_USERNAME'], ENV['TWITTER_PASSWORD'])
  end

end

get '/ping' do
  "Pong"
end

post '/hook' do
  GithubTwitter.new(params[:payload])
  "200"
end
