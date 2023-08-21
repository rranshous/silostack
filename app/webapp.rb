require 'sinatra'

configure do
  set :bind, '0.0.0.0'
  set :port, '4567'
end

get '/' do
  puts "getting root"
  "hello w0rld"
end
