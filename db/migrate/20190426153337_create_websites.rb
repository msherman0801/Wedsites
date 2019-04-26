class CreateWebsites < ActiveRecord::Migration[5.2]
  def change
    create_table :websites do |t|

      t.timestamps
    end
  end
end
