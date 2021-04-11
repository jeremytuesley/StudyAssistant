# Creating new content page
require_relative './utils'
require 'colorize'

# Function to create a category if chosen from the menu
def create_category
  puts 'Please enter your category name:'.cyan
  input = STDIN.gets.chomp
  if input.downcase != 'back'
    if find_category(input) #Checking if category exists
      puts 'That category already exists'.red
      create_category
    else
      save_new_category({ category: input, content: [] }) #Writes category to file
      puts 'Successfully added new category'.green
    end
  end
end

# Function to create more questions if chosen from the menu
def new_question
  back = false
  until back
    puts 'Which category does your question fall under?'.cyan
    category = display_category
    if category == 'Back to Menu'
      back = true
    else 
      puts 'Please enter your question:'.cyan
      ques_input = STDIN.gets.chomp
      if ques_input.downcase == 'back'
        back = true
      else
        # checking if question already exists
        category_set = find_category(category)
        if find_question(category_set['content'], ques_input)
          puts 'That question already exists'.red
        else
          # Create question
          puts 'Please enter the answer:'.cyan
          ans_input = STDIN.gets.chomp.downcase
          create_question(category, { question: ques_input, answer: ans_input })
          puts 'Successfully added new question'.green
        end
      end
    end
  end
end
