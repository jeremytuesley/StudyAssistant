def instructions
  menu = false
  until menu
    puts ''
    puts 'Hi! This is a terminal based text application'
    puts 'To navigate around, follow the prompts given in terminal'
    puts "Type whatever is in the '' quotes to navigate"
    puts 'At anytime, you can type back to go back up a level in the app'
    puts ''
    puts 'To begin, first you need to create some questions, navigate to this from the menu'
    puts 'Create a category first, then you can assign questions to it'
    puts 'If you make a mistake in your category, question or answer, you can modify that in the manage questions section'
    puts 'Once you feel the amount of questions are sufficient, feel free to play the game!'
    puts 'Either by randomly sampling from all categories, or from a specific one'
    puts ''
    puts 'Good luck!'
    puts "Want to go back to the menu? Type 'back'"
    input = gets.chomp
    if input == 'back'
      menu = true
    else
      puts 'Invalid input, please try again'
    end
  end
end
