class Placemark < ActiveRecord::Base
  attr_accessible :latlon, :slug, :year, :year2

  BASE_URL = "http://images.nypl.org/index.php?id="


  def getThumbURL
    imageURL + "&t=b"
  end

  def getFullURL
    imageURL + "&t=w"
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
