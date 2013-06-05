class CheckinController < ApplicationController
  # POST /checkin
  def create
    obj = params[:checkin]
    json = JSON.parse(obj)

    id = json["id"]
    lat = json["venue"]["location"]["lat"]
    lng = json["venue"]["location"]["lng"]
    reply_url = URI("https://api.foursquare.com/v2/checkins/#{id}/reply")

    placemark_url = placemarks_url :q => "#{lat},#{lng}"
    puts placemark_url

    http = Net::HTTP.new(reply_url.host, reply_url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    Net::HTTP.post_form(reply_url, {:url => placemark_url, :CHECKIN_ID => id, :text => "Awesome!"})

    respond_to do |format|
      format.html { render text: "okay" }
      format.json { render json: json }
    end

  end
end
