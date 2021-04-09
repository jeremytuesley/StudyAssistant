require_relative './MenuOptions/play'
require_relative './MenuOptions/manage'
require_relative './MenuOptions/instructions'
require_relative './arguments'
require 'colorize'
require 'tty-prompt'
require 'tty-font'
prompt = TTY::Prompt.new
font = TTY::Font.new(:starwars)
pastel = Pastel.new

quit = false
puts pastel.green(font.write("Welcome to"))
puts pastel.green(font.write("Study"))
puts pastel.green(font.write("Assistant!"))
puts "If this is your first time playing, please read the instructions!".green
puts "At any time within the menu options, type 'back' to go back up the previous menu.".light_blue
puts ''

until quit
  menuChoices = [
    'Play',
    'Instructions',
    'Create/ Manage Questions',
    'Quit',
  ]
  choice = prompt.select('What would you like to do?', menuChoices)
  case (choice)
  when 'Play'
    gameStart
  when 'Instructions'
    instructions
  when 'Create/ Manage Questions'
    manageContent
  when 'Quit'
    puts 'Thanks for playing! Goodbye :)'.cyan
    quit = true
  end
end
