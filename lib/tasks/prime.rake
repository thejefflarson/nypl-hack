namespace :data do 
	task :load => :environment do
		Placemark.delete_all

		JSON.load(File.read("#{Rails.root}/db/initial/lats.json")).each do |k, v|
			p k, v
			v.each do |arr|
				p arr, v
				Placemark.create :year => arr.first, :year2 => arr.second, :slug => arr.last, 
												 :latlon => ::RGeo::Cartesian.preferred_factory().point(k.split.first, k.split.last)
			end		
		end
	end
end