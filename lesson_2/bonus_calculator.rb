LANGUAGE = 'en' # English Version

require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

def messages(message, lang='en')
  MESSAGES[lang][message]
end

def prompt(key)
  message = messages(key, LANGUAGE)
  Kernel.puts("=> #{message}") # standardize the prompt formatting
end

# def valid_number?(num)
#  num.to_i() != 0 || num == '0' # better integer validation; allows zeros input
# end

def integer?(input)
  input.to_i.to_s == input
end

def float?(input)
  input.to_f.to_s == input
end

def number?(num)
  integer?(num) || float?(num) # had the right idea but did not use 3 separate methods
end

def operation_to_message(op) # got this right!
  op_verb = case op
            when '1'
              MESSAGES['add']
            when '2'
              MESSAGES['sub']
            when '3'
              MESSAGES['mult']
            when '4'
              MESSAGES['div']
            end
  # include additional code here
  op_verb
end

prompt('welcome')

name = ''
loop do # name loop
  name = Kernel.gets().chomp()

  if name.empty?()
    prompt('valid_name')
  else
    break
  end
end

prompt('display_name') + " #{name}!" # interpolation not working with this...

loop do # main loop
  number1 = '' # initialized variable
  loop do # number1 loop
    prompt('first_num') # first_num
    number1 = Kernel.gets().chomp()

    if number?(number1)
      break
    else
      prompt('invalid_number')
    end
  end

  number2 = '' # initialized variable
  loop do # number2 loop
    prompt('second_num')
    number2 = Kernel.gets().chomp()

    if number?(number2)
      break
    else
      prompt('invalid_number')
    end
  end

  prompt('operator_list')

  operator = ''
  loop do # operator loop
    operator = Kernel.gets().chomp()

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt('invalid_operator')
    end
  end

  prompt("#{operation_to_message(operator)} #{messages('calculating')}")

  result = case operator # makes the code easier to read; account for floats
           when '1'
             number1.to_f() + number2.to_f()
           when '2'
             number1.to_f() - number2.to_f()
           when '3'
             number1.to_f() * number2.to_f()
           when '4'
             number1.to_f() / number2.to_f()
          end

  prompt("#{messages('result')}  #{result}")

  prompt('calculate_again')
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt('goodbye')
