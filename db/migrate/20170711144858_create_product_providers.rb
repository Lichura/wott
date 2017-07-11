class CreateProductProviders < ActiveRecord::Migration[5.0]
  def change
    create_table :product_providers do |t|
      t.integer :product_id
      t.integer :provider_id

      t.timestamps
    end
  end
end
