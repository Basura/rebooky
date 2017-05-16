class AddMailHandleToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :mail_handle, :string
    User.all.map(&:save) # So the mail handle are generated
  end
end
