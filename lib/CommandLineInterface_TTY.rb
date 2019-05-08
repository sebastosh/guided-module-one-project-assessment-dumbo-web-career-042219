# class CommandLineInterface
#   def run
#       prompt = TTY::Prompt.new
#       system("clear")
#       welcome = prompt.select("Welcome to the Open Call Applications System") do |menu|
#           menu.choice 'Writer'
#           menu.choice 'Open Calls'
#           menu.choice 'Finalists'
#           menu.choice 'Exit'
#       end
#
#       if welcome == 'Writer'
#         writer_menu
#       elsif welcome == 'Open Calls'
#         calls_menu
#       elsif welcome == 'Change Course Name'
#         update_course_name
#       else
#         puts "You have exited the system"
#       end
#   end
#
#   def writer_menu
#     prompt = TTY::Prompt.new
#     system("clear")
#     welcome = prompt.select("Choose an option") do |menu|
#         menu.choice 'View Calls'
#         menu.choice 'Your Applications'
#         menu.choice 'Edit Your Applications'
#         menu.choice 'Exit'
#     end
#
#     if welcome == 'View Calls'
#       Calls.all
#     elsif welcome == 'Your Applications'
#       my_applications
#     elsif welcome == 'Edit Your Applications'
#       my_applications_edit
#     else
#       run
#     end
#   end
#
#
#
#   def calls_menu
#     system("clear")
#     prompt = TTY::Prompt.new
#     title = prompt.ask("Type in your Open Call Title: ", required:true)
#     call_instance = Call.all.find do |call|
#         call.title == title
#     end
#
#     #binding.pry
#     if call_instance == nil
#         puts "Open Call does not exist"
#         sleep(2)
#         run
#     else
#         # list_options(current_inst)
#     end
# end
#
#
#
#   # def run
#   #
#   # puts "Welcome to Writer's Open Call System"
#   # sleep (1)
#   # puts "Choose a menu option"
#   # puts "1. Writers,
#   #       2. Open Calls,"
#   #   answer = gets.chomp
#   #       if answer == "1" || answer == "1."
#   #          sleep(1)
#   #          return writers_menu
#   #       elsif answer == "2" || answer == "2."
#   #          sleep(1)
#   #          return open_call_menu
#   #       else
#   #         sleep(1)
#   #         puts "Sorry, not a valid menu option."
#   #        end
#   #   end
#   # themes = Call.pluck(:theme).uniq
#   # puts
#   # puts themes
#   # puts
#   # puts "Input a Theme to get a list of Open Calls for that theme:"
#   #
#   # theme_name = gets.chomp.capitalize
#   #
#   # results = Call.where(:theme => theme_name)
#   #
#   # puts "Here are all the open calls with themes for: #{theme_name}\n"
#   # puts
#   # puts results.pluck(:title)
#   # puts
#
# end
