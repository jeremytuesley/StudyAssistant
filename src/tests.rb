require_relative './Methods/utils'
require_relative './Methods/game'
require_relative './Methods/new_content'
require_relative './Methods/update_content'
require 'json'
require 'test-unit'

# Function to test if questions.json is accessible
# This is an important test, as without the json, the app is essentially an empty husk
# def test_json
# data_array = JSON.parse(File.read(File_path))
# puts data_array
# end

# Function to test if you are able to create and delete questions, essentially reading and writing to file
class JsonTests < Test::Unit::TestCase
def test_read
  data_array = JSON.parse(File.read(File_path))
  assert_not_nil(data_array)
end

def test_create_category
  save_new_category({ category: 'test_category_name', content: [] })
test_category_exists = find_category('test_category_name')
  assert_equal({"category"=>"test_category_name", "content"=>[]}, test_category_exists)
end

def test_create_question
category_set = find_category('test_category_name') #Reads and pulls category name from json file
question_set = { question: 'ques_test', answer: 'ans_test' }
create_question(category_set, question_set) #Writes to json file
test_question_exists = find_question(category_set['content'], 'ques_test')
# Returns false if question exists, as this checks if question name is available or not
assert_equal(false, test_question_exists)
end

def test_delete_category
delete_category('test_category_name')
test_delete_category = find_category('test_category_name')
assert_equal(false, test_delete_category)
end
end