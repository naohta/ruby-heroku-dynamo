require 'sinatra'

get '/' do
  "Hello world! I'm thin with sinatra. yap!"
end

get '/hello/:name' do
  "hello, #{params[:name]}:)"
end

get '/API/:cmd/:params/:uid/:passkey' do
  "API..."
  "#{params[:cmd]}"
end
