require 'tty-spinner'
require 'colorize'
require_relative '../Methods/utils'

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
  # Sample a random category
  dataArray = JSON.parse(File.read(FilePath))
  category = dataArray.sample

  # Animation UI for random category
  puts 'Randomly picking a category for you'.cyan
  spinner = TTY::Spinner.new("Your random category is ... [:spinner]", format: :arrow_pulse)
  spinner.auto_spin
  sleep(2)
  spinner.stop("#{category['category']}!")

  # Start game
  result = sampleQuestion(category["content"])
  report(result) if result 
end

def mayhemPlay 
  dataArray = JSON.parse(File.read(FilePath))
  allQuestinos = []
  dataArray.each do |item|
    allQuestinos.concat item['content']
  end
  result = sampleQuestion(allQuestinos)
  report(result) if result 
end