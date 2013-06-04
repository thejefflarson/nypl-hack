namespace :data do 
  task :load => :environment do
    Placemark.delete_all

    JSON.load(File.read("#{Rails.root}/db/initial/lats.json")).each do |k, v|
      v.each do |arr|
        Placemark.create :year => arr.first, :year2 => arr.second, :slug => arr.last, 
                         :latlon => ::RGeo::Cartesian.preferred_factory(:srid => 4269).point(k.split(",").first.to_f, k.split(",").last.to_f)
      end    
    end
  end
end