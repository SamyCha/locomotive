class AddPasswordToReviews < ActiveRecord::Migration[5.1]
  def change
    add_column :reviews, :password, :integer
  end
end
