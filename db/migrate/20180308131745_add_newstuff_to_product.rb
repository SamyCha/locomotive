class AddNewstuffToProduct < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :youtube_startsecond, :integer
    add_column :products, :project_url, :string
    add_column :products, :sector, :string
    add_column :products, :framework, :string
    add_column :products, :devolpement_duration, :string
    add_column :products, :number_of_developper, :integer
  end
end
