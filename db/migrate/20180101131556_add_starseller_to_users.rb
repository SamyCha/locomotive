class AddStarsellerToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :starseller, :boolean, default: false
  end
end
