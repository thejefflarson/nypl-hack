require "addressable/uri"

class CheckinController < ApplicationController
  # POST /checkin
  def create
    obj = params[:checkin]
    json = JSON.parse(obj)

    id = json["id"]
    lat = json["venue"]["location"]["lat"]
    lng = json["venue"]["location"]["lng"]
    placemark_url = placemarks_url :q => "#{lat},#{lng}"

    puts obj
    puts "#{id}, #{lat}, #{lng}"
    puts placemark_url

    reply_url = URI("https://api.foursquare.com/v2/checkins/#{id}/reply")
    http = Net::HTTP.new(reply_url.host, reply_url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    body_data = Addressable::URI.new
    body_data.query_values = {:url => placemark_url, :CHECKIN_ID => id, :text => "Awesome!"}

    puts body_data.query_values

    request = Net::HTTP::Post.new(uri.request_uri)
    http.request(request, body_data.query_values)

    respond_to do |format|
      format.html { render text: "okay" }
      format.json { render json: json }
    end

  end
end
