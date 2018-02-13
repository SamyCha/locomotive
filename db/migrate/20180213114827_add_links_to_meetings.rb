class AddLinksToMeetings < ActiveRecord::Migration[5.1]
  def change
    add_column :meetings, :reservation, :string
    add_column :meetings, :participation, :string
  end
end
