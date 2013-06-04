class CreatePlacemarks < ActiveRecord::Migration
  def change
    create_table :placemarks do |t|
      t.spatial :latlon, :srid => 4269, :type => 'POINT'
      t.integer :year
      t.integer :year2
      t.string :slug

      t.timestamps
    end
  end
end
