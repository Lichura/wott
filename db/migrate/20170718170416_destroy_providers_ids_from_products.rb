class DestroyProvidersIdsFromProducts < ActiveRecord::Migration[5.0]
  def change
  	remove_column :products, :provider_ids, :integer
  end
end
