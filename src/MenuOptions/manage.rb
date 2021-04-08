# CREATING CATEGORIES QUESTIONS ANSWERS
require_relative '../Methods/NewContent'
require_relative '../Methods/update.rb'
require 'colorize'
require 'tty-prompt'
def createContent
  prompt = TTY::Prompt.new
  menu_choices = [
    'Create a new category',
    'Create a new question',
    'Manage Categories',
    'Manage Questions',
    'Back to Main Menu',
  ]
  menu = false
  until menu
    choice = prompt.select('What would you like to do?', menu_choices)
    case choice
    when 'Create a new category'
      createCategory
    when 'Create a new question'
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
