class AddItemsToProduct < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :developped_at, :string
    add_column :products, :objectives, :string
  end
end
