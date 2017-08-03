class CreateUserCartProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :user_cart_products do |t|
      t.string :user_id
      t.string :integer
      t.string :product_id
      t.string :integer

      t.timestamps
    end
  end
end
