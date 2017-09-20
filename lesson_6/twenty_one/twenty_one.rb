require 'pry'

PLAYERS = ['Player', 'Dealer']

DECK = {
  hearts: [2, 3, 4, 5, 6, 7, 8, 9, 10, 'jack', 'queen', 'king', 'ace'],
  diamonds: [2, 3, 4, 5, 6, 7, 8, 9, 10, 'jack', 'queen', 'king', 'ace'],
  clubs: [2, 3, 4, 5, 6, 7, 8, 9, 10, 'jack', 'queen', 'king', 'ace'],
  spades: [2, 3, 4, 5, 6, 7, 8, 9, 10, 'jack', 'queen', 'king', 'ace']
}

VALUES = {
  2=>2, 3=>3, 4=>4, 5=>5, 6=>6, 7=>7, 8=>8, 9=>9, 10=>10,
  'jack'=>10, 'queen'=>10, 'king'=>10, 'ace'=>11
}

POINTS_TO_WIN = 21

def prompt(msg)
  puts "=> #{msg}"
end

def initialize_deck
  new_deck = {}
  DECK.each do |suit, cards|
    cards.each do |card|
      new_deck["the #{card} of #{suit}"] = VALUES[card]
    end
  end
  new_deck
end

def joinand(ary, punc=', ', conj='and')
  if ary.size <= 1
    ary.first.to_s
  elsif ary.size == 2
    ary.join(" #{conj} ")
  else
    "#{ary[0..-2].join(punc)}#{punc + conj} #{ary.last}"
  end
end

def deal!(deck, hand)
  hand << deck.shift
end

def player_hit_or_stay
  loop do
    answer = gets.chomp.downcase
    if answer == 'hit' || answer == 'stay'
      return answer
    else
      prompt("Invalid entry. Enter hit or stay.")
    end
  end
end

def count_points(deck, hand)
  hand.map { |card| deck[card] }.reduce(:+)
end

def bust?(hand, deck)
  count_points(deck, hand) > POINTS_TO_WIN ? true : false
end

def reset_aces!(hand, deck)
  until count_points(deck, hand) <= POINTS_TO_WIN || !deck.values.include?(11)
    aces = hand.select { |card| card.to_s.include?('ace') }
    break unless !aces.empty?
    aces.delete_if { |ace| deck[ace] == 1 }
    break if aces.empty?
    deck[aces.first] = 1
  end
end

# Reset card values & shuffle the deck
cards = initialize_deck
shuffled_cards = cards.keys.shuffle

player_hand = []
dealer_hand = []
winner = ''

2.times { deal!(shuffled_cards, player_hand) }
2.times { deal!(shuffled_cards, dealer_hand) }

prompt("The Dealer has #{dealer_hand.size} cards; one is #{dealer_hand.first}.")
prompt("The Dealer has at least #{cards[dealer_hand.first]} points.")
puts ''
prompt("You have #{joinand(player_hand)}.")
prompt("You have #{count_points(cards, player_hand)} points.")
puts ''

# Player's turn
loop do
  prompt("Hit or stay?")
  choice = player_hit_or_stay
  break if choice == 'stay'

  deal!(shuffled_cards, player_hand)
  reset_aces!(player_hand, cards)

  winner = 'Dealer' if bust?(player_hand, cards)
  break if PLAYERS.include?(winner)

  prompt("You have #{joinand(player_hand)}.")
  prompt("You have #{count_points(cards, player_hand)} points.")
end

# Dealer's turn
loop do
  break if PLAYERS.include?(winner) || count_points(cards, dealer_hand) >= 17
  deal!(shuffled_cards, dealer_hand)
  reset_aces!(dealer_hand, cards)

  winner = 'Player' if bust?(dealer_hand, cards)
  break if PLAYERS.include?(winner)
end

unless PLAYERS.include?(winner)
  if count_points(cards, player_hand) > count_points(cards, dealer_hand)
    winner = 'Player'
  elsif count_points(cards, player_hand) < count_points(cards, dealer_hand)
    winner = 'Dealer'
  else
    winner = 'No one'
  end
end

puts ''
prompt("The Dealer has #{joinand(dealer_hand)}.")
prompt("The Dealer #{count_points(cards, dealer_hand)} points.")
prompt('The Dealer busted.') if bust?(dealer_hand, cards)
puts ''
prompt("You have #{joinand(player_hand)}.")
prompt("You have #{count_points(cards, player_hand)} points.")
prompt('You busted.') if bust?(player_hand, cards)
puts ''

prompt("#{winner} wins!")
