class CheckinController < ApplicationController
  # POST /checkin
  def create
    obj = params[:checkin]
    json = JSON.parse(obj)

    id = json["id"]
    user_id = json["user"]["id"]
    lat = json["venue"]["location"]["lat"]
    lng = json["venue"]["location"]["lng"]
    placemark_url = placemarks_url :q => "#{lat},#{lng}"

    access = Authtoken.where(:user_id => user_id).first
    str_token = access.access_token

    puts obj
    puts "#{id}, #{lat}, #{lng}"
    puts placemark_url

    reply_url = URI("https://api.foursquare.com/v2/checkins/#{id}/reply")
    http = Net::HTTP.new(reply_url.host, reply_url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    body_data = URI.encode_www_form(
      "url" => placemark_url,
      "CHECKIN_ID" => id,
      "text" => "Checkout historical photos of nearby buildings from #{Placemark.gimme_photos(lat, lng).map(&:year).uniq.to_sentence}.",
      "oauth_token" => str_token,
      "v" => 20130605
    )

    puts body_data

    request = Net::HTTP::Post.new(reply_url.request_uri)
    request['Content-Type'] = "application/x-www-form-urlencoded"
    response = http.request(request, body_data)
    puts response.body


    respond_to do |format|
      format.html { render text: "okay" }
      format.json { render json: json }
    end

  end
end
