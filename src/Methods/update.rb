# Updating Page
require 'json'
FilePath = '../docs/questions.json'

def manageCategory # Function to modify a category
  categoryFile = File.read(FilePath)
  data_array = JSON.parse(categoryFile)
  puts 'Which category would you like to modify?'
  data_array.each { |item| print "#{item['category']}, " }
  puts ''
  data_array.each do |item|
    input = gets.chomp
    if input.downcase != 'back'
      category_exist = true
      if item['category'].downcase != input.downcase
        puts "That category doesn't exist"
        category_exist = false
        break
      end
    end
    if category_exist == true
      puts 'Please enter the desired updated name for this category'
      input = gets.chomp
      item['category'] = input
      File.open(FilePath, 'w') { |f| f.write(data_array.to_json) }
      puts 'Successfully modified category'
      break
    else
      manageCategory
    end
  end
end
