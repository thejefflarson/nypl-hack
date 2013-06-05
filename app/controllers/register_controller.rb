FOURSQ_CLIENT_ID = ENV['FOURSQ_CLIENT_ID']
FOURSQ_CLIENT_SECRET = ENV['FOURSQ_CLIENT_SECRET']

class RegisterController < ApplicationController
  def create
    redirect_uri = "https://mike.tig.as/nypl-hack/register_callback"

    uri = URI.parse("https://foursquare.com/oauth2/access_token?client_id=#{FOURSQ_CLIENT_ID}&client_secret=#{FOURSQ_CLIENT_SECRET}&grant_type=authorization_code&redirect_uri=#{redirect_uri}&code=" + params[:code])
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    

    request = Net::HTTP::Get.new(uri.request_uri)
    response = JSON.parse(http.request(request).body)
    str_token = response['access_token']
    #puts access_token


    body_data = URI.encode_www_form(
      "oauth_token" => str_token,
      "v" => 20130605
    )

    self_url = URI("https://api.foursquare.com/v2/users/self?#{body_data}")
    http = Net::HTTP.new(self_url.host, self_url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(self_url.request_uri)
    response = http.request(request)
    puts response.body

    json = JSON.parse(response.body)
    user_id = json['response']['user']['id']
    puts user_id

    Authtoken.create(:user_id => user_id, :access_token => str_token)

    respond_to do |format|
      format.html { render text: "Yay!\n#{str_token}" }
    end
  end
end
