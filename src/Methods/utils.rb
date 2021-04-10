require 'json'
require 'tty-prompt'
FilePath = '../docs/questions.json'

# Check if category exists
# @params: [String] category name 
# @returns: [Hash] if found category, returns category item otherwise false
#          e.g. {"category":"fish","content":[{"question":"how many fish","answer":"2"}]}
def findCategory(name)
  dataArray = JSON.parse(File.read(FilePath))
  foundItem = false
  dataArray.each do |item|
    if item['category'].downcase == name.downcase
      foundItem = item
      break
    end
  end
  return foundItem
end

# Check if question exists

# @params: 
# 1. [Array] questionSet , e.g. [{"question":"how many fish","answer":"2"}, {"question":"how many dogs","answer":"2"}]
# 2. [String] question 
# @returns: [Hash] if found question, returns question item otherwise false
# e.g. {"question":"how many fish","answer":"2"}
def findQuestion(questionSet, question)
  foundItem = false
  questionSet.each do |item|
    if item['question'].downcase == question.downcase
      foundItem = item
      break
    end
  end
  return foundItem
end

# Save Category item into file
# @params: [Hash] Category item,
# e.g. {"category":"fish","content":[]}
def saveNewCategory(categoryItem)
  dataArray = JSON.parse(File.read(FilePath))
  dataArray << categoryItem
  File.open(FilePath, 'w') { |f| f.write(dataArray.to_json) }
end

# Update Category Name in the file
# @params: 
# 1. [hash] old Category item 
# 2. [hash] new Category item
# e.g. {"category":"fish","content":[{"question":"how many fish","answer":"2"}]}
def updateCategory(oldName, newName)
  dataArray = JSON.parse(File.read(FilePath))
  dataArray.each_with_index do |item, index|
    if item['category'] == oldName
      item['category'] = newName
      break
    end
  end
  File.open(FilePath, 'w') { |f| f.write(dataArray.to_json) }
end

# Delete Category item in the file
# @params: [String] Category name
def deleteCategory(name)
  dataArray = JSON.parse(File.read(FilePath))
  catergoryItem = findCategory(name)
  dataArray.delete(catergoryItem)
  File.open(FilePath, 'w') { |f| f.write(dataArray.to_json) }
end

# Create new Question set in a category
# @params: 
# 1. [String] Category name 
# 2. [Hash]  question/answer item, e.g. {"question":"how many fish","answer":"2"}
def createQuestions(categoryName, questionSet)
  dataArray = JSON.parse(File.read(FilePath))
  dataArray.each do |item|
    if item['category'] == categoryName
      item['content'] << questionSet
      break
    end
  end
  File.open(FilePath, 'w') { |f| f.write(dataArray.to_json) }
end

# Delete Question set in a category
# @params: 
# 1. [String] category name
# 2. [Hash] question/answer item ,e.g. {"question":"how many fish","answer":"2"}
def deleteQuestions(categoryName, questionSet)
  dataArray = JSON.parse(File.read(FilePath))
  dataArray.each do |item|
    item['content'].delete(questionSet) if item['category'] == categoryName
  end
  File.open(FilePath, 'w') { |f| f.write(dataArray.to_json) }
end

# Display all categories as a menu option
def displayCategory
  prompt = TTY::Prompt.new
  dataArray = JSON.parse(File.read(FilePath))
  menuOptions = []
  dataArray.each { |item| menuOptions << item['category'] }
  menuOptions << 'Back to Menu'
  return prompt.select('', menuOptions)
end

# display each question within a category as a menu option
# @params: [Hash] Category item
# e.g. {"category":"fish","content":[{"question":"how many fish","answer":"2"}]}
def displayQuestion(categoryItem)
  prompt = TTY::Prompt.new
  menuOptions = []
  categoryItem['content'].each { |item| menuOptions << item['question'] }
  menuOptions << 'back'
  return prompt.select('', menuOptions)
end

# Actual game function
# Randomizes questions and displays to user
def sampleQuestion(questionsSet)
  totalQuestions = questionsSet.length() 
  order = 1
  correct = 0
  incorrect = 0
  while order <= totalQuestions
    question = questionsSet.sample
    puts "Question #{order}/#{totalQuestions}: #{question["question"]}".cyan
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
    questionsSet.delete(question)
  end 
  return {totalQuestions: totalQuestions, correct: correct, incorrect: incorrect}
end

# End of game results, totals how many user got correct vs total number of questions
def report(result)
  correctResult = result[:correct]
  totalResult = result[:totalQuestions]
  sum = correctResult/totalResult.to_f * 100 # Maths to give a percentage
  puts "You got #{correctResult}/#{totalResult}, #{sum}% of questions right!".cyan
  # Congratulation statements (basically a win/loss)
  if sum >= 70
    puts "Well done! You're pretty smart.".green 
  elsif sum < 70
    puts "Better luck next time".red
  end
  puts ''
  puts "Thanks for playing!".cyan
end
