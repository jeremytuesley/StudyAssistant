require 'colorize'
def instructions
  menu = false
    puts ''
    puts 'Hi! This is a terminal based text application'.black.on_yellow
    puts 'To navigate around, follow the prompts given in terminal'.black.on_yellow
    puts "Type whatever is in the '' quotes to navigate".black.on_yellow
    puts 'At anytime, you can type back to go back up a level in the app'.black.on_yellow
    puts ''.black.on_yellow
    puts 'To begin, first you need to create some questions, navigate to this from the menu'.black.on_yellow
    puts 'Create a category first, then you can assign questions to it'.black.on_yellow
    puts 'If you make a mistake in your category, question or answer, you can modify that in the manage questions section'.black.on_yellow
    puts 'Once you feel the amount of questions are sufficient, feel free to play the game!'.black.on_yellow
    puts 'Either by randomly sampling from all categories, or from a specific one'.black.on_yellow
    puts ''.black.on_yellow
    puts 'Good luck!'.black.on_yellow
    puts "Want to go back to the menu? Type 'back'".cyan
    until menu
    input = gets.chomp
    if input == 'back'
      menu = true
    else
      puts 'Invalid input, please try again'.red
    end
  end
end
