class RemoveColumnContacts < ActiveRecord::Migration[5.0]
  def change
    remove_column :contacts, :property_id
  end
end
