# frozen_string_literal: true

class AddStateToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :state, :integer, default: 0
    add_index :users, :state
  end
end
