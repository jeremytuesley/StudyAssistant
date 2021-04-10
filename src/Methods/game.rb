require 'tty-spinner'
require 'colorize'
require_relative '../Methods/utils'

def categoryPlay 
 #Choosing a category which program will pull questions from
  puts 'Please choose a category'.cyan
  choice = displayCategory
  if choice != 'Back to Menu'
    category = findCategory(choice)
    # Start of game
    result = sampleQuestion(category["content"])
    report(result) if result #Correct or incorrect feedback
  end
end

def randomPlay 
  # Chooses to let the program to give a random category to user, pulls questions from that category
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
  report(result) if result #Correct or incorrect feedback
end

def mayhemPlay 
  # Ignores categories and gives out all the questions
  dataArray = JSON.parse(File.read(FilePath))
  allQuestinos = []
  dataArray.each do |item|
    allQuestinos.concat item['content']
  end
  #Start of Game
  result = sampleQuestion(allQuestinos)
  report(result) if result #Correct or incorrect feedback
end