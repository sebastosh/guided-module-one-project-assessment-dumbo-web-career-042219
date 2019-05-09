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
      Writer.all.each { |w| puts "#{w.id}. #{w.name}" }
      # puts "5. New User"

      writer = gets.chomp

      puts "1. View your Calls 2. Apply to Calls"
      answer = gets.chomp
        if answer == "1"
          writers_view(writer)
        elsif answer == "2"
          writer_apply(writer)
        else
          puts "Sorry, not a valid menu option."
          run
        end
      end

      def writers_view(writer)
        puts "Here are your applications ordered by Theme with amount of times you applied to those themes"
        puts
        current_writer = Writer.find(writer.to_s)
        calls_by_theme = current_writer.calls.map {|w| w.theme}
        theme_calls = calls_by_theme.group_by(&:itself).map { |k,v| [k, v.count] }.to_h
        puts "Theme Title: Amount"
        puts "___________________"
        theme_calls.each {|t,c| puts "#{t}: #{c}"}
        puts "___________________"
      end



      def writer_apply(writer)
      puts "Choose the open call to submit your written work"

      Call.all.each { |c| puts "#{c.id}. #{c.title} - Theme: #{c.theme}" }

      call = gets.chomp

      # binding.pry
      if Call.pluck(:id).include?(call.to_i)
        #(1..4) === call.to_i
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
      puts "4. View Stuff"
      answer = gets.chomp
    # Edit titles and themes
        if answer == "1"
            puts "Open Call Editor, chose the Open Call you want to edit:"
            Call.all.each.with_index(1){ |c,i| puts "#{c.id}. #{c.title} - Theme: #{c.theme}" }

            call_id = gets.chomp

            if Call.pluck(:id).include?(call_id.to_i)
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

            # Choose a finalist
            elsif answer == "2"
            puts "Choose the Open Call you want to select a finalist for:"
            Call.all.each { |c| puts "#{c.id}. #{c.title} - Theme: #{c.theme}" }

            call_id = gets.chomp
            # binding.pry
            if Call.pluck(:id).include?(call_id.to_i)
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
              end

                finalist = Writer.find_by(id: choosing.finalist_id)

                puts
                puts
                puts "#{finalist.name} is the finalist."
                puts
                puts

                # PLACE FINALIST APPLICATION HERE

                puts "#{choosing.title} is now closed"
                puts
                puts
                sleep(1)
                # binding.pry
                run
              end
# Delete Open Calls

          elsif answer == "3"

              puts "Choose the Open Call you want to delete:"
              Call.all.each { |c| puts "#{c.id}. #{c.title} - Theme: #{c.theme}" }

              tbd = gets.chomp
              # binding.pry
                if (1..4) === tbd.to_i
                  puts "Deleting: #{Call.find(tbd).title}"
                  Call.delete(tbd)
                  sleep(3)
                  puts
                  puts
                else
                  puts "Invalid entry"
                  run
                end

              elsif answer == "4"

                puts "Here's your open calls with total count of applications:"
                Call.all.each { |c| puts "#{c.id}. #{c.title}: #{c.applications.count}" }

                puts "Select a number to see who applied to each call"

                who = gets.chomp

                if Call.pluck(:id).include?(who.to_i)
                  puts "Here are your who applied to this open call"
                  current_call = Call.find(who.to_s)
                  calls_w_writers = current_call.writers.map {|w| w.name}
                  call_writers = calls_w_writers.group_by(&:itself).map { |k,v| [k, v.count] }.to_h
                  puts "Writers"
                  puts "___________________"
                  call_writers.each {|w,c| puts "#{w} applied #{c.to_words} times."}
                  puts "___________________"

                end




            else
              puts "Invalid entry"
              run
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
