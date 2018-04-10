require 'open-uri'
require 'json'
require 'pry-byebug'

Line.destroy_all
Station.destroy_all

puts "Creating lines..."

linha_azul = Line.create!(name: "Linha 1 - Azul")

linha_verde = Line.create!(name: "Linha 2 - Verde")

linha_vermelha = Line.create!(name: "Linha 3 - Vermelha")

linha_lilas = Line.create!(name: "Linha 5 - Lilás")

puts "Created #{Line.count} lines."




url = open('https://gist.githubusercontent.com/rafaelrinaldi/6a82dd1eceed6dfc7deb/raw/a43679cd321e9b779f2eb53e2f9fc8279b7a3c29/stations.json')
parsed = JSON.parse(url.read)

puts "Creating stations..."

parsed.each do |station_collection|
  station_info = station_collection.last
  if station_info["lines"].include?("linha-1-azul")
    byebug
    station = Station.new
    station.name = station_info["title"]
    station.latitude = station_info["location"]["latitude"]
    station.longitude = station_info["location"]["longitude"]
    station.address = station_info["location"]["address"]
    station.lines << linha_azul
    station.save!
  end
end

puts "Created #{Station.count} stations."
