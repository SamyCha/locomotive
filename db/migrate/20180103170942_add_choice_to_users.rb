class AddChoiceToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :choice, :boolean, default: false
  end
end
