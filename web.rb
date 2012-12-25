require 'sinatra'
require './dynamodb.rb'
require 'aws/sts'
require 'aws/dynamo_db'

get '/' do
  "Hello world! I'm thin with sinatra. yap!"
end

get '/hello/:name' do
  "hello, #{params[:name]}:)"
end

get '/api/:cmd/:params/:uid/:passkey' do
  "API..."
  "#{params[:cmd]},#{params[:passkey]}"
end


get '/api/:cmd :uid/' do
  "API..."
  "#{params[:cmd]},#{params[:uid]}"
end

get '/hi/:name' do
  "hi, #{params[:name]}:)"
  
  db = Dynamodb.db
  db.tables.each{|t| puts t.name}
  tbl = db.tables['products']
  tbl.load_schema
  items = tbl.items()
  items.each{|item|
    p "-----------------"
    p item
    item.attributes.each{|attr| p attr}
  }

end

