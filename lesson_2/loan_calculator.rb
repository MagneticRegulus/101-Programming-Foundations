LANGUAGE = 'en'

require 'yaml'
MESSAGES = YAML.load_file('loan_calculator_config.yml')

def messages(message, lang = LANGUAGE)
  MESSAGES[lang][message]
end

def prompt(message) # standardize display messages
  puts "=> #{message}"
end

def integer?(input)
  input.to_i.to_s == input
end

def float?(input)
  input.to_f.to_s == input
end

def positive?(input)
  input.to_f > 0
end

def number?(num)
  (integer?(num) || float?(num)) && positive?(num)
end

def continue?(answer)
  answer.downcase.start_with?('y')
end

def monthly_payment(loan, monthly_interest, months)
  payment = loan * (monthly_interest / (1 - (1 + monthly_interest)**(-1 * months)))
  payment.round(2)
end

prompt(messages('welcome')) # 'welcome'
name = nil

loop do # name loop
  name = gets.chomp
  break unless name.empty?
  prompt(messages('valid_name')) # 'valid_name'
end

prompt("#{messages('display_name')} #{name}") # 'display_name'
# 'about' :
prompt(messages('about'))

loop do # main calculation loop
  loan = nil # total loan in $$$
  monthly_interest = nil
  months = nil # duration in months

  loop do # total loan value
    prompt(messages('loan')) # 'loan'
    loan = gets.chomp
    if number?(loan)
      loan = loan.to_f
      break
    else
      prompt(messages('valid_amount')) # 'valid_amount'
    end
  end

  loop do # annual interest loop
    prompt(messages('interest')) # 'interest'
    yearly_interest = gets.chomp
    if number?(yearly_interest)
      prompt("#{messages('confirm_interest')} #{yearly_interest}%? (y/n)") # 'confirm_interest'
      answer = gets.chomp
      next unless continue?(answer)
      monthly_interest = (yearly_interest.to_f / 12) / 100
      break
    else
      prompt(messages('valid_amount')) # 'valid_amount'
    end
  end

  loop do # duration in years loop
    prompt(messages('years')) # 'years'
    years = gets.chomp
    if number?(years)
      months = years.to_f * 12
      break
    else
      prompt(messages('valid_amount')) # 'valid_amount'
    end
  end

  prompt(messages('repayment_amount')) # 'repayment_amount'
  puts "$#{monthly_payment(loan, monthly_interest, months)}"
  prompt("#{messages('calculate_again')} #{name} (y/n)?") # 'calculate_again'
  answer = gets.chomp
  break unless continue?(answer)
end

prompt(messages('goodbye')) # 'goodbye'
