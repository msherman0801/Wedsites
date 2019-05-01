class CreateWebsites < ActiveRecord::Migration[5.2]
  def change
    create_table :websites do |t|
      t.string :name
      t.string :key
      t.integer :user_id
      t.string :image
      t.timestamps
    end
  end
end
