class AddBodyToCheatsheets < ActiveRecord::Migration[6.0]
  def change
    add_column :cheatsheets, :body, :text
  end
end
