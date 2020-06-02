class AddSlugToCheatsheets < ActiveRecord::Migration[6.0]
  def change
    add_column :cheatsheets, :slug, :string
    add_index :cheatsheets, :slug, unique: true
  end
end
