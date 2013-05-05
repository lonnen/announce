require 'sinatra'

use Rack::Auth::Basic, "Restricted" do |username, password|
  username == 'admin' and password == 'admin'
end

get '/ping' do
  "Pong"
end

post '/' do
  push = JSON.parse(params[:payload])
  "I got some JSON: #{push.inspect}"
end
