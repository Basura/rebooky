class CreateProperties < ActiveRecord::Migration[5.0]
  def change
    create_table :properties do |t|
      t.references :user, foreign_key: true
      t.integer :frequency

      t.timestamps
    end
  end
end
