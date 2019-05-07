class CommandLineInterface

  def run

  puts "Welcome, here's a list of Open Call Themes"

# binding.pry

  themes = Call.pluck(:theme).uniq

  puts themes

  puts "Input a Theme to get a list of Open Calls"

  theme_name = gets.chomp.capitalize

  results = Call.where(:theme => theme_name)

  puts "Here are all the open calls themes for: #{theme_name}\n"

  puts results.pluck(:title)
  
  end



end
