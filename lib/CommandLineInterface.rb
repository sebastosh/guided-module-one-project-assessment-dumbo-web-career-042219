class CommandLineInterface

  def run
    puts "Welcome to Writer's Open Call System"
    puts "Choose a menu option"
    puts "1. Writers 2. Open Calls"
    answer = gets.chomp
      if answer == "1"
        writers_choice
      elsif answer == "2"
        open_calls_menu
      else
        puts "Sorry, not a valid menu option."
      end
    end

    def writers_choice
      puts "Welcome Writer, identify yourself"
      Writer.all.each.with_index(1){ |w,i| puts "#{i}. #{w.name}" }
      # puts "5. New User"
      writer = gets.chomp

      puts "Choose the open call to submit your written work"
      puts "Enter a Call id number to apply"

      Call.all.each.with_index(1){ |c,i| puts "#{i}. #{c.title} - Theme: #{c.theme}" }

      call = gets.chomp

      # binding.pry
      if (1..4) === call.to_i
        puts "Enter your title:"
        title = gets.chomp
        puts "Enter your body:"
        body = gets.chomp
        Application.create(title: title, body: body, writer_id: writer, call_id: call)
        puts
        puts
        puts "Work submitted, thanks"
        sleep(1)
        run
      else
        sleep(1)
        puts "Sorry, not a valid menu option."
        run
      end
    end

    def open_calls_menu
      puts "Choose a menu option"
      puts "1. Update an Open Call"
      puts "2. Choose a Finalist"
      puts "3. Delete an Open Call"
      answer = gets.chomp
        if answer == "1"
          puts "Open Call Editor, chose the Open Call you want to edit:"
          Call.all.each.with_index(1){ |c,i| puts "#{i}. #{c.title} - Theme: #{c.theme}" }

          call_id = gets.chomp
          # binding.pry
          if (1..4) === call_id.to_i
            puts "Edit the title of your open call: #{Call.find(call_id).title}:"
            title = gets.chomp
            puts "Edit the theme of your open call:"
            theme = gets.chomp
            edit_call = Call.find_by(id: call_id)
            edit_call.update(title: title, theme: theme)
            puts "Thanks"
            sleep(1)
            run
          else
            puts "Sorry, not a valid menu option."
            run
          end

          elsif answer == "2"
            puts "Choose the Open Call you want to select a finalist for:"
            Call.all.each.with_index(1){ |c,i| puts "#{i}. #{c.title} - Theme: #{c.theme}" }

            call_id = gets.chomp
            # binding.pry
            if (1..4) === call_id.to_i
            puts "Choosing a finalist for: #{Call.find(call_id).title}, one sec while I think."
            sleep(3)
            choosing = Call.find_by(id: call_id)
            # binding.pry
              applicants = choosing.applications.map do |value|
                value.writer_id
              end
            choosing.update(finalist_id: applicants.sample)
            if choosing.finalist_id != nil
              choosing.toggle(:open).save

              finalist = Writer.find_by(id: choosing.finalist_id)

              puts
              puts
              puts "#{finalist.name} is the finalist."
              puts
              puts
              puts "#{choosing.title} is now closed"
              puts
              puts
              sleep(1)
              # binding.pry
              run
            elsif answer == "3"
              puts "Choose the Open Call you want to delete:"
              Call.all.each.with_index(1){ |c,i| puts "#{i}. #{c.title} - Theme: #{c.theme}" }

              tbd = gets.chomp
              # binding.pry
                if (1..4) === call_id.to_i
                puts "Deleting: #{Call.find(tbd).title}"
                Call.delete(call_id)
                sleep(3)
                puts
                puts
                else
                puts "Invalid entry"
                run
                end
              end
            end
          end
end
end

# def calls_menu
#   puts "Welcome Writer, choose a menu option"
#   puts "1. View Calls 2. Apply 3. Edit"
#   answer = gets.chomp
#       if answer == "1"
#          sleep(1)
#          Call.all.pluck(:title, :theme)
#       elsif answer == "2"
#          sleep(1)
#          open_calls_menu
#       else
#         sleep(1)
#         puts "Sorry, not a valid menu option."
#        end
#        # binding.pry
#   end

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
