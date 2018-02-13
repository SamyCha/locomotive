class AddAvatarToMeetings < ActiveRecord::Migration[5.1]
  def self.up
    add_column :meetings, :avatar_file_name, :string
    add_column :meetings, :avatar_content_type, :string
    add_column :meetings, :avatar_file_size, :integer
    add_column :meetings, :avatar_updated_at, :datetime
  end

  def self.down
    remove_column :meetings, :avatar_file_name
    remove_column :meetings, :avatar_content_type
    remove_column :meetings, :avatar_file_size
    remove_column :meetings, :avatar_updated_at
  end
end
