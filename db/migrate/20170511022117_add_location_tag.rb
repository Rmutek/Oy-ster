class AddLocationTag < ActiveRecord::Migration[5.0]
  def change
    add_column :restaurants, :neighborhood, :string
  end
end
