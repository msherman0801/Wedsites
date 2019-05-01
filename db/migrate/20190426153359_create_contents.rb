class CreateContents < ActiveRecord::Migration[5.2]
  def change
    create_table :contents do |t|
      t.text :spouse_one, default: "Spouse One"
      t.text :spouse_two, default: "Spouse Two"
      t.text :about_us, default: "About Us"
      t.text :summary, default: "Summary"
      t.datetime :date, default: 000
      t.text :location, default: "Location"
      t.text :registry_name, default: "Registry Name"
      t.string :registry_url, default: "Registry URL"
      t.integer :website_id
      t.timestamps
    end
  end
end
