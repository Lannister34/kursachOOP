class RemoveColumnsFromTests < ActiveRecord::Migration[5.2]
  def change
    remove_column :tests, :themes, :string
  end
end
