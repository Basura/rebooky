class CreateInquiries < ActiveRecord::Migration[5.0]
  def change
    create_table :inquiries do |t|
      t.references :contact, foreign_key: true
      t.references :property, foreign_key: true
      t.text :message

      t.timestamps
    end
  end
end
