require 'pry'
def welcome
  puts "Welcome to the Blackjack Table"
end

def deal_card
  rand(11) + 1
end

def display_card_total(card_total)
  puts "Your cards add up to " + card_total.to_s
end

def prompt_user
  puts "Type 'h' to hit or 's' to stay"
end

def get_user_input
  gets.chomp
end

def end_game(card_total)
  puts "Sorry, you hit #{card_total}. Thanks for playing!"
end

def initial_round
  display_card_total(deal_card + deal_card)
  return deal_card + deal_card
end

def hit?(current_card_total)
  prompt_user
  input = get_user_input
  if input == "s"
    current_card_total
  elsif input == "h"
    current_card_total += deal_card
  else
    invalid_command
    hit?(current_card_total)
  end
end

def invalid_command
  puts "Please enter a valid command"
end

#####################################################
# get every test to pass before coding runner below #
#####################################################

def runner
  welcome
  current_card_total = initial_round
  until current_card_total > 21
    current_card_total = hit?(current_card_total)
    display_card_total(current_card_total)
    # binding.pry
  end
  end_game(current_card_total)
end
    
