require_relative './MenuOptions/play'
require_relative './MenuOptions/manage'
require_relative './MenuOptions/instructions'
require 'colorize'
require 'tty-prompt'
prompt = TTY::Prompt.new

quit = false
puts ''
puts 'Welcome! My name is Study Assitant!'.green
puts 'If this is your first time playing, please read the instructions!'.green
puts "At any time within the menu options, type 'back' to go back up the previous menu."
       .green
puts ''

until quit
  menu_choices = [
    'Play',
    'Instructions',
    'Create/ Manage questions',
    'Quit',
  ]
  choice = prompt.select('What would you like to do?', menu_choices)
  case (choice)
  when 'Play'
    puts 'do this play'
  when 'Instructions'
    instructions
  when 'Create more questions'
    createContent
  when 'Manage questions'
    manageContent
  when 'Quit'
    puts 'Thanks for playing! Goodbye :)'.cyan
    quit = true
  end
end
