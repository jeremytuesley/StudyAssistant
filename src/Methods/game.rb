require 'tty-spinner'
require 'colorize'
require_relative '../Methods/utils'

def category_play 
 #Choosing a category which program will pull questions from
  puts 'Please choose a category'.cyan
  choice = display_category
  if choice != 'Back to Menu'
    category = find_category(choice)
    # Start of game
    result = sample_question(category["content"])
    report(result) if result #Correct or incorrect feedback
  end
end

def random_play 
  # Chooses to let the program to give a random category to user, pulls questions from that category
  data_array = JSON.parse(File.read(File_path))
  category = data_array.sample

  # Animation UI for random category
  puts 'Randomly picking a category for you'.cyan
  spinner = TTY::Spinner.new("Your random category is ... [:spinner]", format: :arrow_pulse)
  spinner.auto_spin
  sleep(2)
  spinner.stop("#{category['category']}!")

  # Start game
  result = sample_question(category["content"])
  report(result) if result #Correct or incorrect feedback
end

def mayhem_play 
  # Ignores categories and gives out all the questions
  data_array = JSON.parse(File.read(File_path))
  all_questions = []
  data_array.each do |item|
    all_questions.concat item['content']
  end
  #Start of Game
  result = sample_question(all_questions)
  report(result) if result #Correct or incorrect feedback
end