require_relative './MenuOptions/play'
require_relative './MenuOptions/create'
require_relative './MenuOptions/instructions'
require_relative './MenuOptions/manage'
require 'colorize'
require 'tty-prompt'

quit = false
puts ''
puts 'Welcome! My name is Study Assitant.'
puts "At any time within the menu options, type 'back' to go back up the previous menu"
puts ''

until quit
  puts "What would you like to do? options: 'play' 'instructions' 'create more questions' 'manage questions' 'quit'"
  case (gets.chomp.downcase)
  when 'play'
    puts 'do this play'
  when 'instructions'
    instructions
  when 'create more questions'
    createContent
  when 'manage questions'
    manageContent
  when 'quit'
    puts 'Thanks for playing! Goodbye :)'
    quit = true
  when 'back'
    puts "You're already in the menu! If you wanted to quit, type 'quit'"
  else
    puts 'Input not recognized, please try again'
  end
end
