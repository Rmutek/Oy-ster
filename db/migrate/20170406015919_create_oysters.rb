class CreateOysters < ActiveRecord::Migration[5.0]
  def change
    create_table :oysters do |t|
      t.string :oyster_type
      t.text :description
      t.string :location
      t.string :salinity
      t.string :size

      t.timestamps
    end
  end
end
