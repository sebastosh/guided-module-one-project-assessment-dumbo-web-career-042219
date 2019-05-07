# require 'pry'

class Writer < ActiveRecord::Base
  has_many :applications
  has_many :calls, through: :applications

# Create

# Read

# Update

# Delete


end
