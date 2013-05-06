require 'erb'
require 'json'
require 'mustache'
require 'sinatra'
require 'twitter'

use Rack::Auth::Basic, "Restricted" do |username, password|
  username == ENV['BASIC_USERNAME'] and password == ENV['BASIC_PASSWORD']
end

class GithubTwitter

  def initialize(payload)
    payload = JSON.parse(payload)
    return unless payload.keys.include?("repository")
    return unless payload["ref"].include?("tags")
    return unless payload["before"].include?("0000000000000000000000000")
    repo = payload["repository"]["name"]
    payload['tag'] = payload["ref"][10..-1]

    template = "New {{ name }} tag: {{ tag }} - {{ url }}"
    connect(repo).update(
      Mustache.render(
        template,
        :name => payload['repository']['name'],
        :tag => payload['tag'],
        :url => payload['repository']['url']
      )
    )
  end

  def connect(repo)
    return Twitter::Client.new(
      :oauth_token => ENV['TWITTER_TOKEN'],
      :oauth_token_secret => ENV['TWITTER_TOKEN_SECRET'],
      :consumer_key => ENV['TWITTER_CONSUMER_KEY'],
      :consumer_secret => ENV['TWITTER_CONSUMER_SECRET']
    )
  end

end

get '/ping' do
  "Pong"
end

post '/hook' do
  GithubTwitter.new(params[:payload])
  "200"
end
