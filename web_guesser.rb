require 'sinatra'
require 'sinatra/reloader'

@@secret_number = Random.rand(101)
@@guesses = 5

get '/' do
  guess = params["guess"].to_i
  message = check_guess(guess)
  color = set_color(message)
  erb :index, :locals => {:number => @@secret_number, :guess => guess, :message => message, :color => color}
end

def check_guess(guess)
  @@guesses -= 1
  if @@guesses == 0
    @@guesses = 5
    @@secret_number = Random.rand(101)
    "Sorry, you used all your guesses. The secret number has been reset. Try again. You have 5 guesses."
  else
    if guess == 0
      "Guess a number between 1 and 100. You have 5 guesses to get it right."
    elsif guess > @@secret_number && guess > @@secret_number + 5
      "Way too high!\n You have #{@@guesses} guesses left."
    elsif guess < @@secret_number && guess < @@secret_number - 5
      "Way too low!\n You have #{@@guesses} guesses left."
    elsif guess < @@secret_number
      "Too low!\n You have #{@@guesses} guesses left."
    elsif guess > @@secret_number
      "Too high!\n You have #{@@guesses} guesses left."
    elsif guess == @@secret_number
      @@guesses = 5
      @@secret_number = Random.rand(101)
      "Correct! The secret number has been reset - play again! You have 5 guesses."
    end
  end
end

def set_color(message)
  if message.start_with?("Way")
    "red"
  elsif message.start_with?("Too")
    "#f98989"
  elsif message == "Guess a number between 1 and 100. You have 5 guesses to get it right."
    "white"
  else
    "green"
  end
end
