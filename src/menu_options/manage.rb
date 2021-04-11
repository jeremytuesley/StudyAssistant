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
      begin
      create_category
      rescue
        relating_to = "Creating a new category"
        error_message(relating_to)
      end
    when 'Create a New Question'
      begin
      new_question
      rescue
        relating_to = "Creating a new question"
        error_message(relating_to)
      end
    when 'Change a Category Name'
      begin
      manage_category
      rescue
        relating_to = "Managing a Category"
        error_message(relating_to)
      end
    when 'Delete a Question'
      begin
      manage_question
      rescue
        relating_to = "Deleting a question"
        error_message(relating_to)
      end
    when 'Delete a Category'
      begin
      remove_category
      rescue
        relating_to = "Deleting a category"
        error_message(relating_to)
      end
    when 'Back to Main Menu'
      begin
      menu = true
      rescue
        relating_to = "Main Menu from Manage Menu"
        error_message(relating_to)
      end
    end
  end
end
