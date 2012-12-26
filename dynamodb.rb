require './stopwatch.rb'
sw = Stopwatch.new("require");
require 'aws/sts'
require 'aws/dynamo_db'
sw.stop

class Dynamodb
  sw = Stopwatch.new("Create AWS session");
  security_token_service = AWS::STS.new(
    access_key_id:ENV['AWS_KEY'],
    secret_access_key:ENV['AWS_SECRET']
  )
  session = security_token_service.new_session(duration:60*30)
  AWS.config({dynamo_db_endpoint:"dynamodb.ap-northeast-1.amazonaws.com"})
  sw.stop
  
  sw = Stopwatch.new("Connect to DynamoDB");
  @@db = AWS::DynamoDB.new(
    access_key_id: session.credentials[:access_key_id],
    secret_access_key: session.credentials[:secret_access_key],
    session_token: session.credentials[:session_token]
  )
  sw.stop()
  def self.db()
    @@db
  end
end
