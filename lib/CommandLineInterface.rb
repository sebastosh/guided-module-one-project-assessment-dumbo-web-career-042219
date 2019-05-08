class CommandLineInterface

  def run

  puts "Welcome to Writer's Open Call System"
  sleep (1)
  puts "Choose a menu option"
  puts "1. Writers 2. Open Calls"
    answer = gets.chomp
        if answer == "1" || answer == "1."
           sleep(1)
           return writers_menu
        elsif answer == "2" || answer == "2."
           sleep(1)
           return open_call_menu
        else
          sleep(1)
          puts "Sorry, not a valid menu option."
         end
    end
  # themes = Call.pluck(:theme).uniq
  # puts
  # puts themes
  # puts
  # puts "Input a Theme to get a list of Open Calls for that theme:"
  #
  # theme_name = gets.chomp.capitalize
  #
  # results = Call.where(:theme => theme_name)
  #
  # puts "Here are all the open calls with themes for: #{theme_name}\n"
  # puts
  # puts results.pluck(:title)
  # puts

end
