class RemoveColumnsFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :group, :string
    remove_column :users, :code, :string
    remove_column :users, :status, :boolean
    remove_column :users, :admin, :boolean
  end
end
