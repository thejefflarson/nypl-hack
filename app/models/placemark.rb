class Placemark < ActiveRecord::Base
  attr_accessible :latlon, :slug, :year, :year2

  BASE_URL = "http://images.nypl.org/index.php?id="


  def getThumbURL
    imageURL + "&t=b"
  end

  def getFullURL
    imageURL + "&t=w"
  end

  def self.gimme_photos(lat, lon)
    Placemark.order("ST_Distance(ST_SetSRID(ST_MakePoint(#{lat.to_f}, #{lon.to_f}),4269), latlon) ASC").limit(3)
  end

  private

  def imageURL
    if slug[slug.length-1] == 'a'
      BASE_URL + slug.delete('-a')
    else
      BASE_URL + slug.delete('f-')
    end
  end
end
