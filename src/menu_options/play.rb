# GAME GAME GAME GAME
require 'colorize'
require 'tty-prompt'
require_relative '../Methods/game'
require_relative '../Methods/utils'

def game_start
  menu_choices = [
    'Choose a Category',
    'Random Category',
    'Mayhem(ALL Questions)',
    'Back to Menu',
  ]
  prompt = TTY::Prompt.new
  menu = false
  until menu
    choice = prompt.select('What would you like to do?', menu_choices)
    case choice
    when 'Choose a Category'
      category_play
    when 'Random Category'
      random_play
    when 'Mayhem(ALL Questions)'
      mayhem_play
    when 'Back to Menu'
      menu = true
    end
  end
end