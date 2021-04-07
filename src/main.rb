require_relative './MenuOptions/play'
require_relative './MenuOptions/create'
quit = false

puts 'Welcome! My name is Study Assitant.'
puts "At any time, type 'back' to go back"

until quit
  puts "What would you like to do? options: 'play' 'instructions' 'create more questions' 'manage questions' 'quit'"
  case (gets.chomp.downcase)
  when 'play'
    puts 'do this play'
  when 'create more questions'
    createContent
  when 'manage questions'
    puts 'do this manage'
  when 'quit'
    puts 'Thanks for playing! Goodbye :)'
    quit = true
  else
    puts 'Input not recognized, please try again'
  end
end
