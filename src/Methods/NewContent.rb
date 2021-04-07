require 'json'
FilePath = '../../docs/questions.json'

def createCategory
  categoryFile = File.read(FilePath)
  data_hash = JSON.parse(categoryFile)
  puts 'Please enter your category name:'
  input = gets.chomp.downcase
  hash = { category: input, content: [] }
  data_hash << hash
  File.open(FilePath, 'w') { |f| f.write(data_hash.to_json) }
end
