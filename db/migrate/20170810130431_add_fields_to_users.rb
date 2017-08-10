class AddFieldsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :name, :string
    add_column :users, :lastname, :string
    add_column :users, :dni, :string
    add_column :users, :birth, :date
  end
end
