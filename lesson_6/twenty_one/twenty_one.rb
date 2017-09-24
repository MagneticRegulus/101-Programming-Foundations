PLAYERS = ['Player', 'Dealer']

DECK = {
  hearts: [2, 3, 4, 5, 6, 7, 8, 9, 10, 'jack', 'queen', 'king', 'ace'],
  diamonds: [2, 3, 4, 5, 6, 7, 8, 9, 10, 'jack', 'queen', 'king', 'ace'],
  clubs: [2, 3, 4, 5, 6, 7, 8, 9, 10, 'jack', 'queen', 'king', 'ace'],
  spades: [2, 3, 4, 5, 6, 7, 8, 9, 10, 'jack', 'queen', 'king', 'ace']
}

VALUES = {
  2 => 2, 3 => 3, 4 => 4, 5 => 5, 6 => 6, 7 => 7, 8 => 8, 9 => 9, 10 => 10,
  'jack' => 10, 'queen' => 10, 'king' => 10, 'ace' => 11
}

WINNING_THRESHOLD = 21
DEALER_THRESHOLD = 17
CHAMP_THRESHOLD = 5
QUIT_GAME = 'exit'

def prompt(msg)
  puts "=> #{msg}"
end

def display_rules
  system 'clear'
  prompt("Welcome to #{WINNING_THRESHOLD}!")
  puts ''
  prompt('----------------------The Rules----------------------')
  prompt("Be the closest player to #{WINNING_THRESHOLD} to win.")
  prompt("Go over #{WINNING_THRESHOLD} points, and you bust.")
  prompt("Face cards are 10 points. Aces are 1 or 11 points. " \
         "The rest are face value.")
  prompt("The first to #{CHAMP_THRESHOLD} wins is the champion.")
  puts ''
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
    if answer == 'hit' || answer == 'stay' || answer == QUIT_GAME
      return answer
    else
      prompt("Invalid entry. Enter hit or stay.")
    end
  end
end

def initialize_hands(deck, player, dealer)
  2.times { deal!(deck, player) }
  2.times { deal!(deck, dealer) }
end

def count_points(deck, hand)
  hand.map { |card| deck[card] }.reduce(:+)
end

def bust?(deck, hand)
  count_points(deck, hand) > WINNING_THRESHOLD ? true : false
end

def reset_aces!(deck, hand)
  until count_points(deck, hand) <= WINNING_THRESHOLD ||
        !deck.values.include?(11)
    aces = hand.select { |card| card.to_s.include?('ace') }
    break unless !aces.empty?
    aces.delete_if { |ace| deck[ace] == 1 }
    break if aces.empty?
    deck[aces.first] = 1
  end
end

def display_player_hand(deck, hand)
  prompt("You have #{joinand(hand)}.")
  prompt("You have #{count_points(deck, hand)} points.")
  prompt('You busted.') if bust?(deck, hand)
  puts ''
end

def display_dealer_hand(deck, hand, reveal_all)
  if reveal_all
    prompt("The Dealer has #{joinand(hand)}.")
    prompt("The Dealer #{count_points(deck, hand)} points.")
    prompt('The Dealer busted.') if bust?(deck, hand)
  else
    prompt("The Dealer has #{hand.size} cards; one is #{hand.first}.")
    prompt("The Dealer has at least #{deck[hand.first]} points.")
  end
  puts ''
end

def display_hands(deck, player, dealer, reveal_all=false)
  system 'clear'
  display_player_hand(deck, player)
  display_dealer_hand(deck, dealer, reveal_all)
end

loop do
  player_wins = 0
  dealer_wins = 0
  champion = nil
  answer = nil

  # Game begins
  display_rules

  prompt("Press Enter to begin.")
  prompt("You can input #{QUIT_GAME} at any time to leave the program.")
  answer = gets.chomp
  break if answer.downcase == QUIT_GAME

  loop do
    # Reset card values & shuffle the deck
    cards = initialize_deck
    shuffled_cards = cards.keys.shuffle

    player_hand = []
    dealer_hand = []
    winner = ''

    initialize_hands(shuffled_cards, player_hand, dealer_hand)

    display_hands(cards, player_hand, dealer_hand)

    # Player's turn
    loop do
      prompt("Hit or stay?")
      answer = player_hit_or_stay
      break if answer == 'stay' || answer == QUIT_GAME

      deal!(shuffled_cards, player_hand)
      reset_aces!(cards, player_hand)

      winner = 'Dealer' if bust?(cards, player_hand)
      break if PLAYERS.include?(winner)

      display_hands(cards, player_hand, dealer_hand)
    end

    break if answer == QUIT_GAME

    # Dealer's turn
    loop do
      break if PLAYERS.include?(winner) ||
               count_points(cards, dealer_hand) >= DEALER_THRESHOLD
      deal!(shuffled_cards, dealer_hand)
      reset_aces!(cards, dealer_hand)

      winner = 'Player' if bust?(cards, dealer_hand)
      break if PLAYERS.include?(winner)
    end

    # Decide winner if no one has busted.
    unless PLAYERS.include?(winner)
      if count_points(cards, player_hand) > count_points(cards, dealer_hand)
        winner = 'Player'
      elsif count_points(cards, player_hand) < count_points(cards, dealer_hand)
        winner = 'Dealer'
      else
        winner = 'No one'
      end
    end

    display_hands(cards, player_hand, dealer_hand, true)

    prompt("#{winner} wins!")

    player_wins += 1 if winner == 'Player'
    dealer_wins += 1 if winner == 'Dealer'

    prompt("You have #{player_wins} wins. The Dealer has #{dealer_wins} wins.")
    champion = 'You' if player_wins >= CHAMP_THRESHOLD
    champion = 'The Dealer' if dealer_wins >= CHAMP_THRESHOLD
    break if champion

    prompt('Continue? (y or n)')
    answer = gets.chomp.downcase
    break unless answer.start_with?('y')
  end

  break if answer == QUIT_GAME

  prompt("The Champion is: #{champion}!") if champion

  prompt('Play again? (y or n)')
  answer = gets.chomp.downcase
  break unless answer.start_with?('y')
end

prompt("Thanks for playing #{WINNING_THRESHOLD}! Good-bye.")
