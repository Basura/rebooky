class RemoveMailHandleFromProperties < ActiveRecord::Migration[5.0]
  def change
    remove_column :properties, :mail_handle, :string
  end
end
