class AddInterestToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :interest, :boolean
  end
end
