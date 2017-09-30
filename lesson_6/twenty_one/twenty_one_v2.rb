SUITS = ['hearts', 'diamonds', 'clubs', 'spades']
CARDS = [
  '2', '3', '4', '5', '6', '7', '8', '9', '10', 'jack', 'queen', 'king', 'ace'
]
VALUES = {
  '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6, '7' => 7, '8' => 8,
  '9' => 9, '10' => 10, 'jack' => 10, 'queen' => 10, 'king' => 10, 'ace' => 11
}

WINNING_THRESHOLD = 21
DEALER_THRESHOLD = 17
CHAMP_THRESHOLD = 5
QUIT_GAME = 'exit'

def prompt(msg)
  puts "=> #{msg}"
end

def clear_screen
  system('clear') || system('cls')
end

def display_rules
  clear_screen
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
  new_deck = []
  SUITS.each do |suit|
    CARDS.each do |card|
      new_deck << { suit: suit, card: card, value: VALUES[card] }
    end
  end
  new_deck
end

def join_cards(hand, punc=', ', conj='and')
  if hand.size <= 1
    display_card(hand.first)
  elsif hand.size == 2
    hand.map { |card| display_card(card) }.join(" #{conj} ")
  else
    hand[0..-2].map { |card| display_card(card) }.join(punc).to_s \
      "#{punc + conj} #{display_card(hand.last)}"
  end
end

def deal!(cards, hand)
  hand << cards.shift
end

def initialize_hands!(card, player_cards, dealer_cards)
  2.times do
    deal!(card, player_cards)
    deal!(card, dealer_cards)
  end
  reset_aces!(player_cards)
  reset_aces!(dealer_cards)
end

def display_card(card)
  "the #{card[:card]} of #{card[:suit]}"
end

def count_points(hand)
  hand.map { |card| card[:value] }.reduce(:+)
end

def display_player_hand(hand)
  prompt("You have #{join_cards(hand)}.")
  prompt("You have #{count_points(hand)} points.")
  prompt("You busted.") if bust?(hand)
  puts ''
end

def display_dealer_hand(hand, reveal_all) # add bust
  if reveal_all
    prompt("The Dealer has #{join_cards(hand)}.")
    prompt("The Dealer has #{count_points(hand)} points.")
    prompt("The Dealer busted.") if bust?(hand)
  else
    prompt("The Dealer has #{hand.size} cards; " \
           "one is #{display_card(hand.first)}.")
    prompt("The Dealer has at least #{hand.first[:value] + 2} points.")
  end
  puts ''
end

def display_hands(player_cards, dealer_cards, reveal_all=false)
  clear_screen
  display_player_hand(player_cards)
  display_dealer_hand(dealer_cards, reveal_all)
end

def player_hit_or_stay
  loop do
    answer = gets.chomp.downcase
    if ['hit', 'h', 'stay', 's', QUIT_GAME].include?(answer)
      return answer
    else
      prompt("Invalid entry. Enter hit or stay.")
    end
  end
end

def reset_aces!(hand)
  until count_points(hand) <= WINNING_THRESHOLD ||
        !hand.map { |card| card[:value] }.include?(11)
    aces = hand.select { |card| card[:card] == 'ace' }
    aces.delete_if { |ace| ace[:value] == 1 }
    break if aces.empty?
    hand.each do |card|
      if card[:card] == 'ace'
        card[:value] = 1
        break
      end
    end
  end
end

def bust?(hand)
  count_points(hand) > WINNING_THRESHOLD
end

def player_turn!(cards, hand, dealer_cards)
  loop do
    display_hands(hand, dealer_cards)
    prompt('Hit or stay? (h or s)')
    answer = player_hit_or_stay
    break if answer.start_with?('s') || answer == QUIT_GAME

    deal!(cards, hand)
    reset_aces!(hand)

    break if bust?(hand)
  end
end

def dealer_turn!(cards, hand, player_cards)
  loop do
    break if count_points(hand) >= DEALER_THRESHOLD || bust?(player_cards)
    deal!(cards, hand)
    reset_aces!(hand)
  end
end

def decide_winner(player_cards, dealer_cards)
  unless bust?(player_cards) || bust?(dealer_cards)
    return 'Player' if count_points(player_cards) > count_points(dealer_cards)
    return 'Dealer' if count_points(player_cards) < count_points(dealer_cards)
    return 'No one'
  end
  bust?(player_cards) ? 'Dealer' : 'Player'
end

def display_scores(player_score, dealer_score)
  puts ''
  prompt("--------------Scoreboard--------------")
  prompt("You have #{player_score} wins. The Dealer has #{dealer_score} wins.")
  puts ''
end

def decide_champ(player_score, dealer_score)
  if [player_score, dealer_score].include?(5)
    player_score == 5 ? 'You' : 'The Dealer'
  end
end

# Game begins
loop do
  player_wins = 0
  dealer_wins = 0
  champion = nil

  display_rules

  prompt("Press Enter to begin.")
  prompt("You can input '#{QUIT_GAME}' at any time" \
         " to end your turn or leave the program.")
  answer = gets.chomp
  break if answer.downcase == QUIT_GAME

  # Match begins
  loop do
    # Reset card values & shuffle the deck
    deck = initialize_deck
    deck.shuffle!

    player_hand = []
    dealer_hand = []

    initialize_hands!(deck, player_hand, dealer_hand)
    player_turn!(deck, player_hand, dealer_hand)
    dealer_turn!(deck, dealer_hand, player_hand)

    winner = decide_winner(player_hand, dealer_hand)

    display_hands(player_hand, dealer_hand, true)
    prompt("#{winner} wins!")

    player_wins += 1 if winner == 'Player'
    dealer_wins += 1 if winner == 'Dealer'

    display_scores(player_wins, dealer_wins)
    champion = decide_champ(player_wins, dealer_wins)
    break if champion

    prompt('Continue match? (y or n)')
    answer = gets.chomp.downcase
    break unless answer.start_with?('y')
  end

  prompt("The Champion is: #{champion}!") if champion

  unless answer == QUIT_GAME
    prompt('Play again? (y or n)')
    answer = gets.chomp.downcase
  end
  break unless answer.start_with?('y')
end

prompt("Thanks for playing #{WINNING_THRESHOLD}! Good-bye.")
