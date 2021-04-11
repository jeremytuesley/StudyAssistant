require_relative './menu_options/play'
require_relative './menu_options/manage'
require_relative './menu_options/instructions'
require 'colorize'

if ARGV.include? "--help" # If user includes --help, it will only display instructions and then exit
    puts ''
    puts 'Hi! This is a terminal based text application'.yellow
    puts 'To navigate around, follow the prompts given in terminal (up/down arrow keys, enter to select)'.yellow
    puts "Type whatever is in the '' quotes to navigate".yellow
    puts 'At anytime, you can type back to go back up a level in the app'.yellow
    puts ''
    puts 'To begin, first you need to create some questions, navigate to this from the menu'.yellow
    puts 'Create a category first, then you can assign questions to it'.yellow
    puts 'If you make a mistake in your category name, you can edit that in manage categories'.yellow
    puts 'If you want to delete a question, you can do that in manage questions'.yellow
    puts 'Deleting a category, will REMOVE ALL questions from that category'.white.on_red
    puts 'Once you feel the amount of questions are sufficient, feel free to play the game!'.yellow
    puts 'Either by randomly sampling from all categories, or from a specific one'.yellow
    puts ''
    puts 'Good luck!'.yellow
    puts ''
    puts 'Installation was successful!'.green
    puts "Would you like to launch the game? y/n".cyan
    chosen = false
    until chosen
    case STDIN.gets.chomp.downcase
    when 'y'
        chosen = true
    when 'n'
          puts 'To play, launch the game from the new executable file.'.yellow
          exit
    else
        puts "Input not recognized, try just type 'y' or 'n'".red
    end
end
end

if ARGV.include? "--play" #If user includes --play, it will take them straight to play instead of main menu
game_start
end

if ARGV.include? "--create" #If user includes --create, it will take them straight to the create menu instead of main
    manage_content
end


    