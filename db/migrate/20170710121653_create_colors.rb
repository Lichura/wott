class CreateColors < ActiveRecord::Migration[5.0]
  def change
    create_table :colors do |t|
      t.string :nombre
      t.string :descripcion
      t.string :image

      t.timestamps
    end
  end
end
