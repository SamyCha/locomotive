class AddHighlightToMeetings < ActiveRecord::Migration[5.1]
  def change
    add_column :meetings, :highlight, :boolean
  end
end
