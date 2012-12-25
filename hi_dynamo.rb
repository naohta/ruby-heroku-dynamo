require './dynamodb.rb'
require 'aws/sts'
require 'aws/dynamo_db'

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
