require_relative '../Methods/utils'
FilePath = '../docs/questions.json'

def categoryPlay 
  puts 'Please choose a category'.cyan
  choice = displayCategory
  if choice != 'Back to Menu'
    category = findCategory(choice)
    result = sampleQuestion(category["content"])
    report(result) if result 
  end
end

def randomPlay 
    puts 'randomPlay'
end

def mayhemPlay 
    puts 'mayhemPlay'
end