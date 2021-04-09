# Creating new content page
require_relative './utils'
require 'colorize'

# Function to create a category if chosen from the menu
def createCategory
  puts 'Please enter your category name:'.cyan
  input = STDIN.gets.chomp
  if input.downcase != 'back'
    if findCategory(input)
      puts 'That category already exists'.red
      createCategory
    else
      saveNewCategory({ category: input, content: [] })
      puts 'Successfully added new category'.green
    end
  end
end

# Function to create more questions if chosen from the menu
def createQuestion
  back = false
  until back
    puts 'Which category does your question fall under?'.cyan
    category = displayCategory
    if category == 'Back to Menu'
      back = true
    else 
      puts 'Please enter your question:'.cyan
      quesInput = STDIN.gets.chomp
      if quesInput.downcase == 'back'
        back = true
      else
        # checking if question already exists
        if findQuestion(category['content'], quesInput)
          puts 'That question already exists'.red
        else
          # Create question
          puts 'Please enter the answer:'.cyan
          ansInput = STDIN.gets.chomp.downcase
          createQuestions(category, { question: quesInput, answer: ansInput })
          puts 'Successfully added new question'.green
        end
      end
    end
  end
end
