class AddIsBotToMessages < ActiveRecord::Migration[7.0]
  def change
    add_column :messages, :is_bot, :boolean, default: false
  end
end
