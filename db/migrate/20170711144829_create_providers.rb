class CreateProviders < ActiveRecord::Migration[5.0]
  def change
    create_table :providers do |t|
      t.string :name
      t.string :description
      t.string :nif
      t.string :email
      t.string :tel
      t.string :address
      t.string :contact_name
      t.string :country

      t.timestamps
    end
  end
end
