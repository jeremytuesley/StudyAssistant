# CREATING CATEGORIES QUESTIONS ANSWERS
require_relative '../Methods/newContent'
require_relative '../Methods/utils'
require_relative '../Methods/updateContent'
require 'colorize'
require 'tty-prompt'
def manageContent
  prompt = TTY::Prompt.new
  menuChoices = [
    'Create a New Category',
    'Create a New Question',
    'Change a Category Name',
    'Delete a Question',
    'Delete a Category',
    'Back to Main Menu',
  ]
  menu = false
  until menu
    choice = prompt.select('What would you like to do?', menuChoices)
    case choice
    when 'Create a New Category'
      createCategory
    when 'Create a New Question'
      createQuestion
    when 'Change a Category Name'
      manageCategory
    when 'Delete a Question'
      manageQuestion
    when 'Delete a Category'
      removeCategory
    when 'Back to Main Menu'
      menu = true
    end
  end
end
