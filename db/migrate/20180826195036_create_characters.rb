class CreateCharacters < ActiveRecord::Migration[5.2]
  def change
    create_table :characters do |t|
      t.integer :user_id
      t.integer :campaign_id
      t.string :name
      t.text :description
      t.string :pc_class
      t.integer :level

      t.timestamps
    end
  end
end
