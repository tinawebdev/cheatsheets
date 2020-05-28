class CreateCheatsheets < ActiveRecord::Migration[6.0]
  def change
    create_table :cheatsheets do |t|
      t.string :title
      t.text :body
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
