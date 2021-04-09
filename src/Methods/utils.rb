require 'json'
require 'tty-prompt'
FilePath = '../docs/questions.json'

# Check if category exists
# params: category name (string)
# returns: if found category, returns category item (hash) otherwise false
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

# params: 1. questionSet (array of questions and answers),
#         e.g. [{"question":"how many fish","answer":"2"}, {"question":"how many dogs","answer":"2"}]
#         2. question (string)
# returns: if found question, returns question item (hash) otherwise false
#          e.g. {"question":"how many fish","answer":"2"}
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

# params: 1. Category item (hash),
#         e.g. {"category":"fish","content":[]}
def saveNewCategory(hash)
  dataArray = JSON.parse(File.read(FilePath))
  dataArray << hash
  File.open(FilePath, 'w') { |f| f.write(dataArray.to_json) }
end

# Update Category Name in the file
# params: 1. old Category item (hash), 2. new Category item (hash)
#         e.g. {"category":"fish","content":[{"question":"how many fish","answer":"2"}]}
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
# params: 1.  Category name (string)
def deleteCategory(name)
  dataArray = JSON.parse(File.read(FilePath))
  catergoryItem = findCategory(name)
  dataArray.delete(catergoryItem)
  File.open(FilePath, 'w') { |f| f.write(dataArray.to_json) }
end

# Create new Question set in a category
# params: 1.  category name (string)
#         2. question/answer item (hash) e.g. {"question":"how many fish","answer":"2"}
def createQuestions(categoryName, hash)
  dataArray = JSON.parse(File.read(FilePath))
  dataArray.each do |item|
    if item['category'] == categoryName
      item['content'] << hash
      break
    end
  end
  File.open(FilePath, 'w') { |f| f.write(dataArray.to_json) }
end

# Delete Question set in a category
# It found the category with the same name and update it's content
# params: 1.  category name (string)
#         2. question/answer item (hash) e.g. {"question":"how many fish","answer":"2"}
def deleteQuestions(categoryName, hash)
  dataArray = JSON.parse(File.read(FilePath))
  dataArray.each do |item|
    item['content'].delete(hash) if item['category'] == categoryName
  end
  File.open(FilePath, 'w') { |f| f.write(dataArray.to_json) }
end

# Display all categorys in a line
def displayCategory
  prompt = TTY::Prompt.new
  dataArray = JSON.parse(File.read(FilePath))
  menuOptions = []
  dataArray.each { |item| menuOptions << item['category'] }
  menuOptions << 'Back to Menu'
  return prompt.select('', menuOptions)
end

# display each question within a category
# params: 1.  Category item (hash)
#         e.g. {"category":"fish","content":[{"question":"how many fish","answer":"2"}]}
def displayQuestion(hash)
  prompt = TTY::Prompt.new
  menuOptions = []
  hash['content'].each { |item| menuOptions << item['question'] }
  menuOptions << 'back'
  return prompt.select('', menuOptions)
end
