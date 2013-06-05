class CheckinController < ApplicationController
  # POST /checkin
  def create
    obj = params[:checkin]
    json = JSON.parse(obj)

    id = json["id"]
    lat = json["venue"]["location"]["lat"]
    lng = json["venue"]["location"]["lng"]
    url = URI("https://api.foursquare.com/v2/checkins/#{id}/reply")

    ours = placemarks_url :q => "#{lat},#{lng}"
    p Net::HTTP.post_form(url, {:url => ours, :CHECKIN_ID => id, :text => "Awesome!"}) rescue Errno::ECONNRESET

    respond_to do |format| 
      format.html { render text: "okay" }
      format.json { render json: json }
    end

  end
end