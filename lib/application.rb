class Application < ActiveRecord::Base
  belongs_to :writers
  belongs_to :calls

  # def initialize(title, work, writers_id, calls_id)
  #   @title = title
  #   @work = work
  #   @writers_id = writers_id
  #   @calls_id = calls_id
  # end

end
