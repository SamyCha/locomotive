class AddReviewcodeToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :reviewcode, :integer
  end
end
