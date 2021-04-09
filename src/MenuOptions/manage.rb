# CREATING CATEGORIES QUESTIONS ANSWERS
require_relative '../Methods/newcontent'
require_relative '../Methods/utils'
require_relative '../Methods/update'
require 'colorize'
require 'tty-prompt'
def manageContent
  prompt = TTY::Prompt.new
  menu_choices = [
    'Create a New Category',
    'Create a New Question',
    'Manage Categories',
    'Manage Questions',
    'Back to Main Menu',
  ]
  menu = false
  until menu
    choice = prompt.select('What would you like to do?', menu_choices)
    case choice
    when 'Create a New Category'
      createCategory
    when 'Create a New Question'
      createQuestion
    when 'Manage Categories'
      manageCategory
    when 'Manage Questions'
      manageQuestion
    when 'Back to Main Menu'
      menu = true
    end
  end
end
