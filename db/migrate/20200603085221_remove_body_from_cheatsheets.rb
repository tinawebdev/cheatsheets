class RemoveBodyFromCheatsheets < ActiveRecord::Migration[6.0]
  def change
    remove_column :cheatsheets, :body, :text
  end
end
