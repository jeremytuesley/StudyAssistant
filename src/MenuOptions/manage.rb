# manage questions, categories etc
def manageContent
  menu = false
  until menu
    puts "Would you like to manage a: 'category' or 'question'?"
    case gets.chomp.downcase
    when 'category'
      manageCategory
    when 'question'
      manageQuestion
    when 'back'
      menu = true
    else
      puts 'Invalid input, please try again'
    end
  end
end


