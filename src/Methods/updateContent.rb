# Updating Page
require 'json'
require 'colorize'
require_relative './utils.rb'

def manageCategory # Function to modify a category
  menu = false
  until menu
    puts "Which category would you like to modify?, or select 'Back to Menu'"
           .cyan
    choice = displayCategory
    availableName = false
    if choice == 'Back to Menu'
      menu = true
      availableName = true
    end
    while !availableName
      puts "Please enter the desired updated name for this category, or type 'back'"
             .cyan
      newCategoryName = STDIN.gets.chomp
      if newCategoryName.downcase == 'back'
        menu = true
        availableName = true
      elsif findCategory(newCategoryName)
        puts 'That category already exists'.red
      else
        availableName = true
        menu = true
        updateCategory(choice, newCategoryName)
        puts 'Successfully modified category, sending you back to the menu..'
               .green
      end
    end
  end
end

def manageQuestion # Function to delete a question
  menu = false
  until menu
    puts "What category does your question fall under?, or select 'Back to Menu'"
    choice = displayCategory
    availableName = false
    if choice == 'Back to Menu'
      menu = true
      availableName = true
    end
    while !availableName
      puts "Which question would you like to delete?, or select 'back'".cyan
      categoryItem = findCategory(choice)
      questionChoice = displayQuestion(categoryItem)
      questionItem = findQuestion(categoryItem['content'], questionChoice)
      if questionChoice == 'back'
        menu = true
        availableName = true
      elsif !questionItem
        puts "That question doesn't exist".red
      else
        menu = true
        availableName = true
        deleteQuestions(choice, questionItem)
        puts 'Successfully deleted this question, sending you back to the menu..'
               .green.green
      end
    end
  end
end

def removeCategory # Function to remove a category
  menu = false
  until menu
    puts "Which category would you like to delete?, or select 'Back to Menu'"
           .cyan
    puts 'WARNING: THIS WILL REMOVE ALL QUESTIONS WITHIN THE CATEGORY'
           .red
    choice = displayCategory
    availableName = false
    if choice == 'Back to Menu'
      menu = true
    else
      deleteCategory(choice)
      puts 'Successfully removed category, sending you back to the menu..'.green
      menu = true
    end
  end
end
