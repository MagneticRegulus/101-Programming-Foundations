PLAYERS = ['Player', 'Computer']
INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                [[1, 5, 9], [3, 5, 7]]              # diags

def prompt(msg)
  puts "=> #{msg}"
end

def joinor(ary, punc=', ', conj='or')
  if ary.size <= 1
    ary.first.to_s
  elsif ary.size == 2
    ary.join(" #{conj} ")
  else
    "#{ary[0..-2].join(punc)}#{punc + conj} #{ary.last}"
  end
end

# rubocop:disable Metrics/AbcSize
def display_board(brd)
  system 'clear'
  puts "You're #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}."
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end
# rubocop:enable Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt("Choose a square: #{joinor(empty_squares(brd))}")
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt("Sorry, that's not a valid choice.")
  end

  brd[square] = PLAYER_MARKER
end

def find_move(brd, mark)
  square = nil
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(mark) == 2
      next if !square.nil?
      square = line.select { |sqr| empty_squares(brd).include?(sqr) }.first
    end
  end
  square
end

def computer_places_piece!(brd)
  square = find_move(brd, COMPUTER_MARKER) # offense
  square = find_move(brd, PLAYER_MARKER) if square.nil? # defense
  square = 5 if empty_squares(brd).include?(5) && square.nil? # pick 5
  square = empty_squares(brd).sample if square.nil? # take what you can
  brd[square] = COMPUTER_MARKER
end

def place_piece!(brd, player)
  if player == PLAYERS.first
    player_places_piece!(brd)
  elsif player == PLAYERS.last
    computer_places_piece!(brd)
  end
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_champ(player_score, computer_score)
  if player_score >= 5
    'Player'
  elsif computer_score >= 5
    'Computer'
  end
end

def champion?(player_score, computer_score)
  !!detect_champ(player_score, computer_score)
end

def alternate_player(player)
  player == PLAYERS.first ? PLAYERS.last : PLAYERS.first
end

# Main Loop
loop do
  player_wins = 0
  computer_wins = 0
  ties = 0

  prompt('Welcome to Tic Tac Toe!')
  prompt('Play against the Computer. The first to win 5 games wins the match!')
  prompt('You will take turns playing first.')
  prompt('Press Enter to flip the coin to see who goes first!')
  answer = gets.chomp
  break if answer.downcase == 'exit'

  first_player = PLAYERS.sample

  prompt("#{first_player} goes first! Press Enter to start the match.")
  answer = gets.chomp
  break if answer.downcase == 'exit'

  # Match Loop
  loop do
    board = initialize_board
    current_player = first_player

    # Game Loop
    loop do
      display_board(board)
      place_piece!(board, current_player)
      current_player = alternate_player(current_player)
      break if someone_won?(board) || board_full?(board)
    end

    display_board(board)

    if someone_won?(board)
      prompt("#{detect_winner(board)} won the round!")
    else
      prompt("It's a tie!")
    end

    case detect_winner(board)
    when 'Player' then player_wins += 1
    when 'Computer' then computer_wins += 1
    else
      ties += 1
    end

    break if champion?(player_wins, computer_wins)

    puts ''
    prompt('----------Scoreboard----------')
    prompt("Player: #{player_wins}. Computer: #{computer_wins}. Ties: #{ties}.")
    prompt('The first to 5 wins the match.')

    puts ''
    prompt('Continue the match? (y or n)')
    answer = gets.chomp
    break unless answer.downcase.start_with?('y')

    first_player = alternate_player(first_player)

  end

  puts ''
  prompt('----------Final Scores----------')
  prompt("Player: #{player_wins}. Computer: #{computer_wins}. Ties: #{ties}.")
  if champion?(player_wins, computer_wins)
    prompt("#{detect_champ(player_wins, computer_wins)} wins the match!")
  else
    prompt('You have forfeited the match to the Computer.')
  end

  puts ''
  prompt("Play another match? First to 5 wins. (y or n)")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt("Thanks for playing Tic Tac Toe! Good-bye!")
