class CreateTests < ActiveRecord::Migration[5.2]
  def change
    create_table :tests do |t|
      t.string :title
      t.text :question
      t.text :answer
      t.string :theme
      t.integer :points
    end
  end
end
