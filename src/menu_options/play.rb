# GAME GAME GAME GAME
require 'colorize'
require 'tty-prompt'
require_relative '../Methods/game'
require_relative '../Methods/utils'
def game_start
  menu_choices = [
    'Choose a Category',
    'Random Category',
    'Mayhem(ALL Questions)',
    'Back to Menu',
  ]
  prompt = TTY::Prompt.new
  menu = false
  until menu
    choice = prompt.select('What would you like to do?', menu_choices)
    case choice
    when 'Choose a Category'
      begin
      category_play
      rescue
        relating_to = "Choosing a category"
        error_message(relating_to)
      end
    when 'Random Category'
      begin
      random_play
      rescue
        relating_to = "Random Category Play Options"
        error_message(relating_to)
      end
    when 'Mayhem(ALL Questions)'
      begin
      mayhem_play
      rescue
        relating_to = "Mayhem Play Option"
        error_message(relating_to)
      end
    when 'Back to Menu'
      menu = true
    end
  end
end

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