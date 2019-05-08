class Call < ActiveRecord::Base
  has_many :applications
  has_many :writers, through: :applications


  # Read - Get a list of applications with writer name, title, and body
  def get_applications
    # binding.pry
    self.applications.map do |value|
      puts "Writer: #{value.writer_name}"
      puts "Title: #{value.title}"
      puts "Body: #{value.body}"
    end
  end

  def applicant_names
    # binding.pry
    self.applications.map do |value|
      value.writer_name
    end
  end

  def applicant_ids
    # binding.pry
    self.applications.map do |value|
      value.writer_id
    end
  end

  # self.applications.map do (:title, :body)
  # wid = Application.all.where(writer_id: num)
  # wid.map {|writer| writer.writer.name}

# Update Open Call Details
  def update_call_title(new_title)
    Call.where(:id => self.id).update(title: new_title)
  end

  def update_call_theme(new_theme)
    Call.where(:id => self.id).update(theme: new_theme)
  end

# Update - Choose the finalist application,
  def choose_finalist
    chosen = self.applicant_ids.sample
    self.update(finalist_id: chosen)
  end

  def announce_finalist
    puts "The finalist is #{@finalist}"
  end

  def close_call
    if self.finalist_id != nil
      self.toggle(:open).save
      puts "#{self.title} is now closed"
    end
  end


end
