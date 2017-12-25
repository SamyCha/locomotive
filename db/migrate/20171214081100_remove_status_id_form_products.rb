# frozen_string_literal: true

class RemoveStatusIdFormProducts < ActiveRecord::Migration[5.1]
  def change
    remove_index :products, :status
  end
end
