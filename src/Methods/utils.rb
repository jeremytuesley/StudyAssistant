require 'json'
FilePath = '../docs/questions.json'

# Check if category exists
# params: category name (string)
# returns: if found category, returns category item (hash) otherwise false
#          e.g. {"category":"fish","content":[{"question":"how many fish","answer":"2"}]}
def findCategory(name)
  data_array = JSON.parse(File.read(FilePath))
  foundItem = false
  data_array.each do |item|
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
  data_array = JSON.parse(File.read(FilePath))
  data_array << hash
  File.open(FilePath, 'w') { |f| f.write(data_array.to_json) }
end

# Update Category Name in the file
# params: 1. old Category item (hash), 2. new Category item (hash)
#         e.g. {"category":"fish","content":[{"question":"how many fish","answer":"2"}]}
def updateCategory(oldName, newName)
  data_array = JSON.parse(File.read(FilePath))
  data_array.each_with_index do |item, index|
    if item['category'] == oldName
      item['category'] = newName
      break
    end
  end
  File.open(FilePath, 'w') { |f| f.write(data_array.to_json) }
end

# Delete Category item in the file
# params: 1.  Category item (hash)
#         e.g. {"category":"fish","content":[{"question":"how many fish","answer":"2"}]}
def deleteCategory(hash)
  data_array = JSON.parse(File.read(FilePath))
  data_array.each_with_index do |item, index|
    if item['category'] == hash['category']
      data_array.delete_at(index)
      break
    end
  end
  File.open(FilePath, 'w') { |f| f.write(data_array.to_json) }
end

# update Question set in the file
# It found the category with the same name and update it's content
# params: 1.  Category item (hash)
#         e.g. {"category":"fish","content":[]}
def updateQuestions(hash)
  data_array = JSON.parse(File.read(FilePath))
  data_array.each_with_index do |item, index|
    if item['category'] == hash['category']
      data_array[index] = hash
      break
    end
  end
  File.open(FilePath, 'w') { |f| f.write(data_array.to_json) }
end

# Display all categorys in a line
def displayCategory
  data_array = JSON.parse(File.read(FilePath))
  data_array.each { |item| print "#{item['category']}, " }
  puts ''
end

# display each question within a category
# params: 1.  Category item (hash)
#         e.g. {"category":"fish","content":[{"question":"how many fish","answer":"2"}]}
def displayQuestion(hash)
  hash["content"].each { |item| puts "#{item['question']}, " }
end