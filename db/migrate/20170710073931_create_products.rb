class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.integer :family_id
      t.float :price
      t.integer :provider_ids
      t.integer :tax_ids
      t.integer :color_id
      t.integer :stock_disponible
      t.integer :stock_reservado
      t.integer :stock_pedido
      t.integer :stock_fisico
      t.boolean :descuento
      t.boolean :activo
      t.integer :packaging_id

      t.timestamps
    end
  end
end
