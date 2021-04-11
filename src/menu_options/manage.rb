# CREATING CATEGORIES QUESTIONS ANSWERS
require_relative '../Methods/new_content'
require_relative '../Methods/utils'
require_relative '../Methods/update_content'
require 'colorize'
require 'tty-prompt'
def manage_content
  prompt = TTY::Prompt.new
  menu_choices = [
    'Create a New Category',
    'Create a New Question',
    'Change a Category Name',
    'Delete a Question',
    'Delete a Category',
    'Back to Main Menu',
  ]
  menu = false
  until menu
    choice = prompt.select('What would you like to do?', menu_choices)
    case choice
    when 'Create a New Category'
      create_category
    when 'Create a New Question'
      new_question
    when 'Change a Category Name'
      manage_category
    when 'Delete a Question'
      manage_question
    when 'Delete a Category'
      remove_category
    when 'Back to Main Menu'
      menu = true
    end
  end
end
