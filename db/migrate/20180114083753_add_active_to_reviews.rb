class AddActiveToReviews < ActiveRecord::Migration[5.1]
  def change
    add_column :reviews, :active, :boolean
  end
end
