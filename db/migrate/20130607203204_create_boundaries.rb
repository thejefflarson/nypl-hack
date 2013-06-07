class CreateBoundaries < ActiveRecord::Migration
  def change
    create_table :boundaries do |t|
      t.string :slug
      t.spatial :shape, :srid => 4269, :type => 'MULTIPOLYGON'

      t.timestamps
    end
  end
end
