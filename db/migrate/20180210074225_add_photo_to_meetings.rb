class AddPhotoToMeetings < ActiveRecord::Migration[5.1]
  def change
    add_column :meetings, :photo, :string
  end
end
