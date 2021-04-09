require 'json'
FilePath = '../docs/questions.json'

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

def saveNewCategory(hash)
  data_array = JSON.parse(File.read(FilePath))
  data_array << hash
  File.open(FilePath, 'w') { |f| f.write(data_array.to_json) }
end

def updateCategory(oldHash, newHash)
  data_array = JSON.parse(File.read(FilePath))
  data_array.each_with_index do |item, index|
    if item['category'] == oldHash['category']
      data_array[index] = newHash
      break
    end
  end
  File.open(FilePath, 'w') { |f| f.write(data_array.to_json) }
end

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

def displayCategory
  data_array = JSON.parse(File.read(FilePath))
  data_array.each { |item| print "#{item['category']}, " }
end
