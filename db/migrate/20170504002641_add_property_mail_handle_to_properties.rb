class AddPropertyMailHandleToProperties < ActiveRecord::Migration[5.0]
  def change
    add_column :properties, :mail_handle, :string
  end
end
