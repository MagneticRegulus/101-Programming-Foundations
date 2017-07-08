VALID_CHOICES = %w(rock paper scissors lizard spock)
GAME_NAME = VALID_CHOICES.map(&:capitalize)
VALID_ENTRY = {
  r: 'rock',
  p: 'paper',
  sc: 'scissors',
  l: 'lizard',
  sp: 'spock'
}
WIN_CONDITIONS = {
  rock: %w(scissors lizard),
  paper: %w(rock spock),
  scissors: %w(paper lizard),
  lizard: %w(paper spock),
  spock: %w(rock scissors)
}

def prompt(message)
  Kernel.puts("=> #{message}")
end

def win?(first, second)
  WIN_CONDITIONS.fetch(first.to_sym).include?(second)
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You won the round!")
  elsif win?(computer, player)
    prompt("Computer won the round!")
  else
    prompt("It's a tie!")
  end
end

def display_scores(player, computer)
  if player == 5
    prompt("Player wins the game #{player} to #{computer}!")
  elsif computer == 5
    prompt("Computer wins the game #{computer} to #{player}!")
  else
    prompt("Current scores - Player: #{player}, Computer; #{computer}")
  end
end

# main loop
loop do
  choice = ''
  player_score = 0
  computer_score = 0
  prompt("Let's play #{GAME_NAME.join(' ')}!")
  prompt("First player to reach 5 points wins the game!")
  Kernel.puts()
  # champion loop
  loop do
    # choice loop
    loop do
      prompt("Choose one: #{VALID_CHOICES.join(', ')}.")
      prompt("You can also choose by shortcut:")
      VALID_ENTRY.each { |k, v| prompt("#{k} = #{v}") }
      choice = Kernel.gets().chomp().downcase()

      if VALID_CHOICES.include?(choice)
        break
      elsif VALID_ENTRY.keys.include?(choice.to_sym)
        choice = VALID_ENTRY.fetch(choice.to_sym).to_s
        break
      else
        prompt("That's not a valid choice.")
      end
    end

    computer_choice = VALID_CHOICES.sample

    prompt("You chose: #{choice}; Computer chose: #{computer_choice}.")
    display_results(choice, computer_choice)

    if win?(choice, computer_choice)
      player_score += 1
    elsif win?(computer_choice, choice)
      computer_score += 1
    end
    display_scores(player_score, computer_score)

    if player_score == 5
      break
    elsif computer_score == 5
      break
    else
      prompt('Press any key to continue to the next round.')
      Kernel.gets()
      Kernel.puts()
    end
  end

  prompt("Do you want to play again?")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt("Thank you for playing. Good bye!")
