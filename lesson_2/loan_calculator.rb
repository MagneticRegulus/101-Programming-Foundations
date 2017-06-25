LANGUAGE = 'en'

require 'yaml'
MESSAGES = YAML.load_file('loan_calculator_config.yml')

def messages(message, lang = LANGUAGE)
  MESSAGES[lang][message]
end

def prompt(message, extra='')
  puts "=> #{messages(message)}" + extra
end

def invalid_name?(name)
  name.delete(' ').empty? || number?(name)
end

def integer?(input)
  input.to_i.to_s == input
end

def float?(input)
  input.to_f.to_s == input
end

def number?(input)
  integer?(input) || float?(input)
end

def positive_number?(num)
  num.to_f.positive? && number?(num)
end

def valid_entry?(entry)
  case entry.downcase
  when 'y', 'yes', 'n', 'no'
    true
  else
    false
  end
end

def continue?(answer)
  answer.downcase.start_with?('y')
end

def monthly_payment(loan, monthly_interest, months)
  payment =
    loan * (monthly_interest / (1 - (1 + monthly_interest)**(-1 * months)))
  format("%.2f", payment)
end

prompt('welcome')
name = nil

# name loop
loop do
  name = gets.chomp
  break unless invalid_name?(name)
  prompt('valid_name')
end

prompt('display_name', " #{name}!")
prompt('about')

# main calculation loop
loop do
  loan = nil
  monthly_interest = nil
  months = nil

  # loan value loop
  loop do
    prompt('loan')
    loan = gets.chomp
    if positive_number?(loan)
      loan = loan.to_f
      break
    else
      prompt('valid_amount')
    end
  end

  # annual interest loop
  loop do
    prompt('interest')
    yearly_interest = gets.chomp
    if positive_number?(yearly_interest)
      answer = nil
      prompt('confirm_interest', " #{yearly_interest}%? (y/n)")
      loop do
        answer = gets.chomp
        break if valid_entry?(answer)
        prompt('valid_entry')
      end
      next unless continue?(answer)
      monthly_interest = (yearly_interest.to_f / 12) / 100
      break
    else
      prompt('valid_amount')
    end
  end

  # duration in years loop
  loop do
    prompt('years')
    years = gets.chomp
    if positive_number?(years)
      months = years.to_f * 12
      break
    else
      prompt('valid_amount')
    end
  end

  prompt('repayment_amount')
  puts "$#{monthly_payment(loan, monthly_interest, months)}"

  prompt('calculate_again', " #{name}? (y/n)")
  answer = nil
  loop do
    answer = gets.chomp
    break if valid_entry?(answer)
    prompt('valid_entry')
  end
  break unless continue?(answer)
end

prompt('goodbye')
