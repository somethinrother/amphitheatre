class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.string :role
      t.integer :campaign_id
      t.integer :user_id

      t.timestamps
    end
  end
end
