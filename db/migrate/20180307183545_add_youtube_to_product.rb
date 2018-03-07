class AddYoutubeToProduct < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :youtube_id, :string
  end
end
