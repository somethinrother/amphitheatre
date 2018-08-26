class CreateBlueBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :blue_books do |t|
      t.string :title
      t.text :body
      t.string :reward
      t.integer :chapter_id
      t.integer :character_id

      t.timestamps
    end
  end
end
