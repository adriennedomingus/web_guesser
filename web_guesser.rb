require 'sinatra'
require 'sinatra/reloader'

number = Random.rand(101)
get '/' do
  erb :index, :locals => {:number => number}

end
