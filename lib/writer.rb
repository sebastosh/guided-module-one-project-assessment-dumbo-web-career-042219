# require 'pry'

class Writer < ActiveRecord::Base
  has_many :applications
  has_many :calls, through: :applications

# attr_accessor :application, :call

# Create

  def new_application(title, body, call_id)
    # binding.pry
    Application.create(title: title, body: body, writer_id: self.id, call_id: call_id)
  end

# Read

  def my_applications
    self.applications.pluck(:title, :body)
  end

# Update

  def update_app_title(call_id, new_title)
    Application.where(:writer_id => self.id).update(title: new_title)
  end

  def update_app_body(call_id, new_body)
    Application.where(:writer_id => self.id).update(body: new_body)
  end

  # Delete

  def delete_app(application_id)
    Application.delete(application_id)
  end

end
