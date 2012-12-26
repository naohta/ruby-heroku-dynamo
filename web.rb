require 'sinatra'
require './dynamodb.rb'
require 'aws/sts'
require 'aws/dynamo_db'

get '/' do
  "Merry Christmas!"
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


get '/products/as_json3' do
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
    s += JSON.pretty_generate(item.attributes.to_h)
  }
  s += "]"
  return s
end



get '/products/as_json4' do
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
    s += item.attributes.to_h.to_json
  }
  s += "]"
  return s
end


get '/products/as_json5' do
  content_type :json
  db = Dynamodb.db
  db.tables.each{|t| puts t.name}
  tbl = db.tables['products']
  tbl.load_schema
  items = tbl.items()
  s = "["
  
  first=true; items.each{ |item|
    if(first) then first=false else s+="," end
    s += item.attributes
    item.attributes.each{ |a|
      s += '{"'
      s += a[0]
      s += '","'
      s += a[1]
      s += '"}'
    }
  }
  s += "]"
  return s
end


