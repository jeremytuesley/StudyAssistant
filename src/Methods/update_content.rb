# Updating Page
require 'json'
require 'colorize'
require_relative './utils.rb'

def manage_category # Function to modify a category
  menu = false
  until menu
    puts "Which category would you like to modify?, or select 'Back to Menu'"
           .cyan
    choice = display_category
    available_name = false
    if choice == 'Back to Menu'
      menu = true
      available_name = true
    end
    while !available_name
      puts "Please enter the desired updated name for this category, or type 'back'"
             .cyan
      new_category_name = STDIN.gets.chomp
      if new_category_name.downcase == 'back'
        menu = true
        available_name = true
      elsif find_category(new_category_name)
        puts 'That category already exists'.red
      else
        available_name = true
        menu = true
        update_category(choice, new_category_name)
        puts 'Successfully modified category, sending you back to the menu..'
               .green
      end
    end
  end
end

def manage_question # Function to delete a question
  menu = false
  until menu
    puts "What category does your question fall under?, or select 'Back to Menu'"
    choice = display_category
    available_name = false
    if choice == 'Back to Menu'
      menu = true
      available_name = true
    end
    while !available_name
      puts "Which question would you like to delete?, or select 'back'".cyan
      category_item = find_category(choice)
      question_choice = display_question(category_item)
      question_item = find_question(category_item['content'], question_choice)
      if question_choice == 'back'
        menu = true
        available_name = true
      elsif !question_item
        puts "That question doesn't exist".red
      else
        menu = true
        available_name = true
        delete_question(choice, question_item)
        puts 'Successfully deleted this question, sending you back to the menu..'
               .green.green
      end
    end
  end
end

def remove_category # Function to remove a category
  menu = false
  until menu
    puts "Which category would you like to delete?, or select 'Back to Menu'"
           .cyan
    puts 'WARNING: THIS WILL REMOVE ALL QUESTIONS WITHIN THE CATEGORY'
           .red
    choice = display_category
    available_name = false
    if choice == 'Back to Menu'
      menu = true
    else
      delete_category(choice)
      puts 'Successfully removed category, sending you back to the menu..'.green
      menu = true
    end
  end
end
