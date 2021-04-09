# GAME GAME GAME GAME
require 'colorize'
require 'tty-prompt'
require_relative '../Methods/game'
require_relative '../Methods/utils'

def gameStart
  menuChoices = [
    'Choose a Category',
    'Random Category',
    'Mayhem(ALL Questions)',
    'Back to Menu',
  ]
  prompt = TTY::Prompt.new
  menu = false
  until menu
    choice = prompt.select('What would you like to do?', menuChoices)
    case choice
    when 'Choose a Category'
      categoryPlay
    when 'Random Category'
      randomPlay
    when 'Mayhem(ALL Questions)'
      mayhemPlay
    when 'Back to Menu'
      menu = true
    end
  end
end