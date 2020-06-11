class AddHashtagsToCheatsheets < ActiveRecord::Migration[6.0]
  def change
    add_column :cheatsheets, :hashtags, :string
  end
end
