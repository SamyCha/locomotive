class AddStatusToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :status, :boolean
    add_index :products, :status
  end
end

