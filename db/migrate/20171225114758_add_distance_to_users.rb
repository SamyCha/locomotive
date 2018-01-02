# frozen_string_literal: true

class AddDistanceToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :distance, :integer, default: 25
  end
end
