require 'sinatra'
require 'sinatra/reloader'

number = Random.rand(101)
get '/' do
  guess = params["guess"].to_i
  if guess > number && guess > number + 5
    message = "Way too high!"
  elsif guess < number && guess < number - 5
    message = "Way too low!"
  elsif guess < number
    message = "Too low!"
  elsif guess > number
    message = "Too high!"
  elsif guess == number
    message = "Correct! The secret number is #{number}"
  end
  erb :index, :locals => {:number => number, :guess => guess, :message => message}
end
