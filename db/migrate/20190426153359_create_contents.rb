class CreateContents < ActiveRecord::Migration[5.2]
  def change
    create_table :contents do |t|
      t.text :spouse_one, default: "Spouse One"
      t.text :spouse_two, default: "Spouse Two"
      t.text :about_us, default: "About Us"
      t.text :summary, default: "Summary"
      t.datetime :date
      t.text :location, default: "Location"
      t.text :contact_name, default: "Contact Name"
      t.text :contact_number, default: "(111) 222-3333"
      t.text :registry_name, default: "Registry Name"
      t.string :registry_url, default: "Registry URL"
      t.integer :website_id
      t.timestamps
    end
  end
end
