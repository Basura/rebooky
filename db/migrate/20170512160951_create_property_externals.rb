class CreatePropertyExternals < ActiveRecord::Migration[5.0]
  def change
    create_table :property_externals do |t|
      t.references :property, foreign_key: true
      t.string :external_id
      t.string :entity

      t.timestamps
    end
  end
end
