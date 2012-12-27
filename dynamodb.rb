require './stopwatch.rb'
sw = Stopwatch.new("require");
require 'aws/sts'
require 'aws/dynamo_db'
sw.stop


class Dynamodb
  sw = Stopwatch.new("Create AWS session");

  secrets = [ENV['AWS_KEY'], ENV['AWS_SECRET']]
  if(secrets[0]==nil) then
    puts "secrets[0] is nil. There may be no heroku configs on this env. I will read local secrets file."
    h = Hash[*File.read('.nao.secrets').split(/[ \n]+/)] 
    secrets = [ h['aws_access_key_id'], h['aws_secret_access_key'] ]
  end
  security_token_service = AWS::STS.new(
    access_key_id: secrets[0],
    secret_access_key: secrets[1]
  ); secrets = nil
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
