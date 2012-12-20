require 'sinatra'

get '/' do
  "Hello world! I'm thin with sinatra. yap!"
end

get '/hello/:name' do
  "hello, #{params[:name]}:)"
end

get '/api/:cmd/:params/:uid/:passkey' do
  "API..."
  "#{params[:cmd]},#{params[passkey]}"
end


get '/api/:cmd :uid/' do
  "API..."
  "#{params[:cmd]},#{params[:uid]}"
end
