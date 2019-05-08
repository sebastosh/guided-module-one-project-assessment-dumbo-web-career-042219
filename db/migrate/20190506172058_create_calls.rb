class CreateCalls < ActiveRecord::Migration[5.2]
  def change
    create_table :calls do |t|
      t.string :title
      t.string :theme
      t.integer :finalist_id
      t.boolean :open, default: true
    end
  end
end
