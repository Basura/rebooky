class AddColumnsProperties < ActiveRecord::Migration[5.0]
  def change
    add_column :properties, :title, :string
    add_column :properties, :description, :text
    add_column :properties, :city, :string
    add_column :properties, :state, :string
    add_column :properties, :bedrooms, :integer
    add_column :properties, :sleeps, :integer
    add_column :properties, :recreational_type, :integer
    add_column :properties, :home_type, :integer
    remove_column :properties, :name, :string
  end
end
