class CreateFixedCosts < ActiveRecord::Migration[5.0]
  def change
    create_table :fixed_costs do |t|
      t.string :name
      t.string :descripcion
      t.float :amount
      t.datetime :valid_from
      t.datetime :valid_until
      t.string :payment_code
      t.string :supplier
      t.string :service_code
      t.integer :currency_id

      t.timestamps
    end
  end
end
