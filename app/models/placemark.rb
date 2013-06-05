class Placemark < ActiveRecord::Base
  attr_accessible :latlon, :slug, :year, :year2

  BASE_URL = "http://images.nypl.org/index.php?id="

  def getDetailsURL
    if slug[slug.length-1] == 'a'
        "http://digitalgallery.nypl.org/nypldigital/id?" + slug.delete('-a')
    else
      BASE_URL + slug.delete('f-')
    end
  end

  def getThumbURL
    imageURL + "&t=b"
  end

  def getFullURL
    imageURL + "&t=w"
  end

  def self.gimme_photos(lat, lon)
    #Placemark.select("*, ST_Distance(ST_SetSRID(ST_MakePoint(#{lat.to_f}, #{lon.to_f}),4269), latlon) as distance").where("distance < 800").order("distance ASC").limit(8)
    Placemark.order("ST_Distance(ST_SetSRID(ST_MakePoint(#{lat.to_f}, #{lon.to_f}),4269), latlon) ASC").limit(8)
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
