class AddMeetingToPhotos < ActiveRecord::Migration[5.1]
  def change
    add_reference :photos, :meeting, foreign_key: true
  end
end
