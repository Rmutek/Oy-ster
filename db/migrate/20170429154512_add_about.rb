class AddAbout < ActiveRecord::Migration[5.0]
  def change
    add_column :restaurants, :about, :text
  end
end
