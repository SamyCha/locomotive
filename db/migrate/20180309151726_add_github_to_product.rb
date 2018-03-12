class AddGithubToProduct < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :github, :string
  end
end
