class CreateApplications < ActiveRecord::Migration[5.2]
  def change
    create_table :applications do |t|
      t.string :title
      t.text :body
      t.integer :writer_id
      t.integer :call_id
    end
  end
end
