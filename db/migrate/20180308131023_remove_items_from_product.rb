class RemoveItemsFromProduct < ActiveRecord::Migration[5.1]
  def change
    remove_column :products, :brand, :string
    remove_column :products, :size, :string
    remove_column :products, :color, :string
    remove_column :products, :state, :string
    remove_column :products, :interest, :boolean
    remove_column :products, :price, :integer
  end
end
