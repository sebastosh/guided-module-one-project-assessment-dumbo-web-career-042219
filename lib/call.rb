class Call < ActiveRecord::Base
  has_many :applications
  has_many :writers, through: :applications

  # Create

  # Read

  # Update

  # Delete



end
