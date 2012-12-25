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

get '/products/as_html' do
  db = Dynamodb.db
  db.tables.each{|t| puts t.name}
  tbl = db.tables['products']
  tbl.load_schema
  items = tbl.items()
  s = ""
  items.each{|item|
    s += "-----------------<br/>"
    item.attributes.each{|attr| s += (attr.to_s + "<br/>")}
  }
  
  return s
end


def to_j(item) 

  

end


get '/products/as_json' do
  content_type :json
  db = Dynamodb.db
  db.tables.each{|t| puts t.name}
  tbl = db.tables['products']
  tbl.load_schema
  items = tbl.items()
  s = "["
  items.each{ |item|
    s += (JSON.generate(item.attributes.to_h) + ",")
  }
  s += "]"
  return s
end

get '/products/as_json2' do
  content_type :json
  db = Dynamodb.db
  db.tables.each{|t| puts t.name}
  tbl = db.tables['products']
  tbl.load_schema
  items = tbl.items()
  s = "["
  
  first=true; items.each{ |item|
    if(first) then first=false else s+="," end
    p "item.attributes", item.attributes
    p "item.attributes.to_h", item.attributes.to_h
    p "JSON.generate(item.attributes.to_h)", JSON.generate(item.attributes.to_h)
    s += JSON.generate(item.attributes.to_h)
  }
  s += "]"
  return s
end
