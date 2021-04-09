require_relative './utils'
require 'colorize'

# Function to create a category if chosen from the menu
def createCategory
  puts 'Please enter your category name:'.cyan
  input = gets.chomp
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
    displayCategory

    cataInput = gets.chomp
    category = findCategory(cataInput)
    if cataInput.downcase == 'back'
      back = true
    elsif category
      # if category already exists
      puts 'Please enter your question:'.cyan
      quesInput = gets.chomp
      if quesInput.downcase == 'back'
        back = true
      else
        # checking if question already exists
        if findQuestion(category['content'], quesInput)
          puts 'That question already exists'.red
        else
          # Create question
          puts 'Please enter the answer:'.cyan
          ansInput = gets.chomp.downcase
          category['content'] << { question: quesInput, answer: ansInput }
          updateQuestions(category)
          puts 'Successfully added new question'.green
        end
      end
    else
      # if category doesn't exist
      puts "That category doesn't exist, try again? y/n".red
      input = gets.chomp.downcase
      if input == 'y'
        createQuestion
      else
        break
      end
    end
  end
end
