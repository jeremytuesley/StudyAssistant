# CREATING CATEGORIES QUESTIONS ANSWERS
require_relative '../Methods/NewContent'

def createContent
  menu = false
  until menu
    puts "Would you like to create a new: 'category' or 'question'?"
    case gets.chomp.downcase
    when 'category'
      createCategory
    when 'question'
      createQuestion
    when 'back'
      menu = true
    else
      puts 'Invalid input, please try again'
    end
  end
end
