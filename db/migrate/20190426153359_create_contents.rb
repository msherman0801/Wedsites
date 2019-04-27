class CreateContents < ActiveRecord::Migration[5.2]
  def change
    create_table :contents do |t|
      t.text :spouse_one
      t.text :spouse_two
      t.text :about_us
      t.text :summary
      t.datetime :date
      t.text :location
      t.text :registry_name
      t.string :registry_url
      t.timestamps
    end
  end
end
