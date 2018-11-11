class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.integer :campaign_id
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
