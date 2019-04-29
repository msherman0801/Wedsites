class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.text :title
      t.string :description
      t.datetime :date 
      t.string :location
      t.string :attire
      t.timestamps
    end
  end
end
