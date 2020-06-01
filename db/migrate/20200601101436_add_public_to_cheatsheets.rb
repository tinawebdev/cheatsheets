class AddPublicToCheatsheets < ActiveRecord::Migration[6.0]
  def change
    add_column :cheatsheets, :public, :boolean, default: true
  end
end
