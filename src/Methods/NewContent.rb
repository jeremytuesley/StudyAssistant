require 'json'
FilePath = '../docs/questions.json'

def createCategory # Function to create a category if chosen from the menu
  categoryFile = File.read(FilePath)
  data_array = JSON.parse(categoryFile)
  puts 'Please enter your category name:'
  input = gets.chomp
  if input.downcase != 'back'
    category_taken = false
    data_array.each do |item|
      if item['category'].downcase == input.downcase
        puts 'That category already exists'
        category_taken = true
        break
      end
    end
    if category_taken == false
      hash = { category: input, content: [] }
      data_array << hash
      File.open(FilePath, 'w') { |f| f.write(data_array.to_json) }
      puts 'Successfully added new category'
    else
      createCategory
    end
  end
end

def createQuestion
  back = false
  until back
    categoryFile = File.read(FilePath)
    data_array = JSON.parse(categoryFile)
    puts 'Which category does your question fall under?' # Checking if category exists so question can be assigned to it
    data_array.each { |item| print "#{item['category']}, " }
    puts ''
    cata_input = gets.chomp
    data_array.each do |item|
      back = true if cata_input == 'back'
      if !back
        if item['category'].downcase == cata_input.downcase
          # Creating the question and checking if it exists already also
          puts 'Please enter your question:'
          input = gets.chomp
          question_taken = false
          back = true if input == 'back'
          if input != 'back'
            item['content'].each do |content|
              if content['question'].downcase == input.downcase
                puts 'That question already exists'
                question_taken = true
                break
              end
            end
            if question_taken == false
              puts 'Please enter the answer:'
              ans_input = gets.chomp.downcase
              item['content'] << { question: input, answer: ans_input }
              File.open(FilePath, 'w') { |f| f.write(data_array.to_json) }
              puts 'Successfully added new question'
              break
            end
          end
        elsif item['category'].downcase != cata_input.downcase
          puts "That category doesn't exist, try again? y/n"
          input = gets.chomp
          if input == 'y'
            createQuestion
          else
            break
          end
        end
      end
    end
  end
end
