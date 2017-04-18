class CreatePeakSeasons < ActiveRecord::Migration[5.0]
  def change
    create_table :peak_seasons do |t|
      t.string :name

      t.timestamps
    end
  end
end
