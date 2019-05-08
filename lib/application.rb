class Application < ActiveRecord::Base
  belongs_to :writer
  belongs_to :call

  # attr_reader :application, :call

  # def initialize(title, body, writers_id, calls_id)
  #   @title = title
  #   @body = body
  #   @writers_id = writers_id
  #   @calls_id = calls_id
  # end

  def writer_name
    self.writer.name
  end

end
