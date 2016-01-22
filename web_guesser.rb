require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = Random.rand(101)
get '/' do
  guess = params["guess"].to_i
  message = check_guess(guess)
  color = set_color(message)
  erb :index, :locals => {:number => SECRET_NUMBER, :guess => guess, :message => message, :color => color}
end

def check_guess(guess)
  if guess > SECRET_NUMBER && guess > SECRET_NUMBER + 5
    "Way too high!"
  elsif guess < SECRET_NUMBER && guess < SECRET_NUMBER - 5
    "Way too low!"
  elsif guess < SECRET_NUMBER
    "Too low!"
  elsif guess > SECRET_NUMBER
    "Too high!"
  elsif guess == SECRET_NUMBER
    "Correct! The secret number is #{SECRET_NUMBER}."
  end
end

def set_color(message)
  if message == "Way too high!" || message == "Way too low!"
    "red"
  elsif message == "Too low!" || message == "Too high!"
    "#f98989"
  else
    "green"
  end
end
