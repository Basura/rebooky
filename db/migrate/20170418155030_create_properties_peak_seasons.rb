class CreatePropertiesPeakSeasons < ActiveRecord::Migration[5.0]
  def change
    create_table :peak_seasons_properties do |t|
      t.references :property, foreign_key: true
      t.references :peak_season, foreign_key: true
    end
  end
end
