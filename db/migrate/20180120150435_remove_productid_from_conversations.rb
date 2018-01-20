class RemoveProductidFromConversations < ActiveRecord::Migration[5.1]
  def change
    remove_reference :conversations, :product, foreign_key: true
  end
end
