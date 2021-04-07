# CREATING CATEGORIES QUESTIONS ANSWERS
require_relative '../Methods/NewContent'

puts "Would you like to create a new: 'category' or 'question'?"
puts "To go back to the menu, type: 'back to menu'"
case gets.chomp.downcase
when 'category'
    createCategory

when 'question'
  createQuestion

else
  puts "Invalid input, please try again"
end