class CreateWebsites < ActiveRecord::Migration[5.2]
  def change
    create_table :websites do |t|
      t.string :name
      t.integer :user_id
      t.timestamps
    end
  end
end
