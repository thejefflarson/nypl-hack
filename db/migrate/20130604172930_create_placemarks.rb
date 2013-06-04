class CreatePlacemarks < ActiveRecord::Migration
  def change
    create_table :placemarks do |t|
      t.spatial :latlon
      t.integer :year
      t.integer :year2
      t.char :slug

      t.timestamps
    end
  end
end
