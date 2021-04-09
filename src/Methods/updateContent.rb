# Updating Page
require 'json'
require 'colorize'
require_relative './utils.rb'
FilePath = '../docs/questions.json'

def manageCategory # Function to modify a category
  puts 'Which category would you like to modify?'.cyan
  displayCategory
  input = gets.chomp
  categoryItem = findCategory(input)
  puts categoryItem
  if !categoryItem
    puts "That category doesn't exist".red
    manageCategory
  else
    availableName = false
    until availableName
      puts 'Please enter the desired updated name for this category'.cyan
      newCategoryName = gets.chomp
      if findCategory(newCategoryName)
        puts 'That category already exists'.red
      else
        availableName = true
        updateCategory(categoryItem['category'], newCategoryName)
        puts 'Successfully modified category, sending you back to the menu..'
               .green
      end
    end
  end
end
