class CreateUserAdresses < ActiveRecord::Migration[5.0]
  def change
    create_table :user_adresses do |t|
      t.integer :user_id
      t.string :street
      t.string :second_street
      t.string :zip
      t.string :phone
      t.string :cellphone
      t.string :floor
      t.string :stairs
      t.string :door
      t.string :building
      t.string :other
      t.string :country
      t.string :province
      t.string :city

      t.timestamps
    end
  end
end
