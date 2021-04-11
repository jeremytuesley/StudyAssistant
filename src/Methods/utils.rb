require 'json'
require 'tty-prompt'
File_path = '../docs/questions.json'

# Check if category exists
# @params: [String] category name 
# @returns: [Hash] if found category, returns category item otherwise false
#          e.g. {"category":"fish","content":[{"question":"how many fish","answer":"2"}]}
def find_category(name)
  data_array = JSON.parse(File.read(File_path))
  found_item = false
  data_array.each do |item|
    if item['category'].downcase == name.downcase
      found_item = item
      break
    end
  end
  return found_item
end

# Check if question exists

# @params: 
# 1. [Array] question_set , e.g. [{"question":"how many fish","answer":"2"}, {"question":"how many dogs","answer":"2"}]
# 2. [String] question 
# @returns: [Hash] if found question, returns question item otherwise false
# e.g. {"question":"how many fish","answer":"2"}
def find_question(question_set, question)
  found_item = false
  question_set.each do |item|
    if item['question'].downcase == question.downcase
      found_item = item
      break
    end
  end
  return found_item
end

# Save Category item into file
# @params: [Hash] Category item,
# e.g. {"category":"fish","content":[]}
def save_new_category(category_item)
  data_array = JSON.parse(File.read(File_path))
  data_array << category_item
  File.open(File_path, 'w') { |f| f.write(data_array.to_json) }
end

# Update Category Name in the file
# @params: 
# 1. [hash] old Category item 
# 2. [hash] new Category item
# e.g. {"category":"fish","content":[{"question":"how many fish","answer":"2"}]}
def update_category(old_name, new_name)
  data_array = JSON.parse(File.read(File_path))
  data_array.each_with_index do |item, index|
    if item['category'] == old_name
      item['category'] = new_name
      break
    end
  end
  File.open(File_path, 'w') { |f| f.write(data_array.to_json) }
end

# Delete Category item in the file
# @params: [String] Category name
def delete_category(name)
  data_array = JSON.parse(File.read(File_path))
  category_item = find_category(name)
  data_array.delete(category_item)
  File.open(File_path, 'w') { |f| f.write(data_array.to_json) }
end

# Create new Question set in a category
# @params: 
# 1. [String] Category name 
# 2. [Hash]  question/answer item, e.g. {"question":"how many fish","answer":"2"}
def create_question(category_name, question_set)
  data_array = JSON.parse(File.read(File_path))
  data_array.each do |item|
    if item['category'] == category_name
      item['content'] << question_set
      break
    end
  end
  File.open(File_path, 'w') { |f| f.write(data_array.to_json) }
end

# Delete Question set in a category
# @params: 
# 1. [String] category name
# 2. [Hash] question/answer item ,e.g. {"question":"how many fish","answer":"2"}
def delete_question(category_name, question_set)
  data_array = JSON.parse(File.read(File_path))
  data_array.each do |item|
    item['content'].delete(question_set) if item['category'] == category_name
  end
  File.open(File_path, 'w') { |f| f.write(data_array.to_json) }
end

# Display all categories as a menu option
def display_category
  prompt = TTY::Prompt.new
  data_array = JSON.parse(File.read(File_path))
  menu_options = []
  data_array.each { |item| menu_options << item['category'] }
  menu_options << 'Back to Menu'
  return prompt.select('', menu_options)
end

# display each question within a category as a menu option
# @params: [Hash] Category item
# e.g. {"category":"fish","content":[{"question":"how many fish","answer":"2"}]}
def display_question(category_item)
  prompt = TTY::Prompt.new
  menu_options = []
  category_item['content'].each { |item| menu_options << item['question'] }
  menu_options << 'back'
  return prompt.select('', menu_options)
end

# Actual game function
# Randomizes questions and displays to user
def sample_question(question_set)
  total_questions = question_set.length() 
  order = 1
  correct = 0
  incorrect = 0
  while order <= total_questions
    question = question_set.sample
    puts "Question #{order}/#{total_questions}: #{question["question"]}".cyan
    puts "Your answer is:".green
    answer = STDIN.gets.chomp.downcase
    # Allowing user to back out of game
    if answer.downcase == 'back'
      return false
      # Checking if answer matches answer in system and giving feedback
    elsif answer == question["answer"].downcase
      puts "Correct!".green
      correct += 1
    else 
      puts "Incorrect! The correct answer is:".red
      puts "#{question["answer"]}".green
      incorrect += 1
    end
    # Beginning next question and removing picked question from the pool
    order += 1
    question_set.delete(question)
  end 
  return {total_questions: total_questions, correct: correct, incorrect: incorrect}
end

# End of game results, totals how many user got correct vs total number of questions
def report(result)
  correct_result = result[:correct]
  total_result = result[:total_questions]
  sum = correct_result/total_result.to_f * 100 # Maths to give a percentage
  puts "You got #{correct_result}/#{total_result} correct! That's #{sum}% of questions right!".cyan
  # Congratulation statements (basically a win/loss)
  if sum >= 70
    puts "Well done! You're pretty smart.".green 
  elsif sum < 70
    puts "Better luck next time".red
  end
  puts ''
  puts "Thanks for playing!".cyan
end
