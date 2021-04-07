require_relative './MenuOptions/play'
require_relative './MenuOptions/create'
quit = false
menu = true
until quit
  if menu
    puts "What would you like to do? options: 'play' 'instructions' 'create more questions' 'manage questions' 'quit'"
    menu = false
  end
  case (gets.chomp.downcase)
  when 'play'
    puts 'do this play'
  when 'create more questions'
    puts 'do this create'
  when 'manage questions'
    puts 'do this manage'
  when 'back to menu'
    menu = true
  when 'quit'
    puts 'Thanks! Goodbye :)'
    quit = true
  else
    puts 'Input not recognized, please try again'
  end
end
