class AddThemesToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :themes, :string
  end
end
