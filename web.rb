require 'sinatra'

use Rack::Auth::Basic, "Restricted" do |username, password|
  username == ENV['USERNAME'] and password == ENV['PASSWORD']
end

get '/ping' do
  "Pong"
end

post '/hook' do
  push = JSON.parse(params[:payload])
  p push
end
