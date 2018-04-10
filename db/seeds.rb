require 'open-uri'
require 'json'
require 'pry-byebug'

StationsLine.destroy_all
Line.destroy_all
Panel.destroy_all
PanelType.destroy_all
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
  station = Station.new
  station.name = station_info["title"]
  station.latitude = station_info["location"]["latitude"]
  station.longitude = station_info["location"]["longitude"]
  station.address = station_info["location"]["address"]
  station_info["lines"].each do |line|
    if line.include?("linha-1-azul")
      station.lines << linha_azul
    elsif line.include?("linha-2-verde")
      station.lines << linha_verde
    elsif line.include?("linha-3-vermelha")
      station.lines << linha_vermelha
    elsif line.include?("linha-5-lilas")
      station.lines << linha_lilas
    end
  end
  station.save
end

station = Station.new
station.name = "Adolfo Pinheiro"
station.latitude = -23.650237
station.longitude = -46.7061442
station.address = "Av. Adolfo Pinheiro, 301 - Santo Amaro, São Paulo - SP, 04753-060"
station.lines << linha_lilas
station.save

station = Station.new
station.name = "Alto da Boa Vista"
station.latitude = -23.6413461
station.longitude = -46.7015247
station.address = "Av. Santo Amaro, 6936 - Santo Amaro, São Paulo - SP, 04702-002"
station.lines << linha_lilas
station.save

station = Station.new
station.name = "Borba Gato"
station.latitude = -23.6335141
station.longitude = -46.6950494
station.address = "Av. Santo Amaro, São Paulo - Estado de São Paulo, 04701-000"
station.lines << linha_lilas
station.save

station = Station.new
station.name = "Brooklin"
station.latitude = 23.6265811
station.longitude = -46.690056
station.address = "Av. Jardim das Acacias, São Paulo - Estado de São Paulo, 04605-000"
station.lines << linha_lilas
station.save

station = Station.new
station.name = "Eucaliptos"
station.latitude = -23.6128272
station.longitude = -46.6711394
station.address = "Av. Ibirapuera, 3144 - Indianópolis, São Paulo - SP, 04028-003"
station.lines << linha_lilas
station.save

puts "Created #{Station.count} stations."



puts "Creating Panel Types"

PanelType.create!(name: "Painel Clássico",
                  total_area: "0,74m x 1,12m",
                  visible_area: "0,74m x 1,12m (0,82m²)",
                  security_area: "0,70m x 1,08m",
                  impression: "UV 300dpi"
                  )

PanelType.create!(name: "Painel Super",
                  total_area: "2,175m x 1,09m",
                  visible_area: "2,16m x 1,07m (2,31m²)",
                  security_area: "2,12m x 1,03m",
                  impression: "UV 300dpi"
                  )

PanelType.create!(name: "Painel Dupla Face",
                  total_area: "2,23m x 1,52m",
                  visible_area: "2,22m x 1,48m (3,28m²)",
                  security_area: "2,18m x 1,44m",
                  impression: "UV 300dpi"
                  )

PanelType.create!(name: "Painel Escadas",
                  total_area: "0,41m x 0,61m",
                  visible_area: "0,41m x  0,61m (0,25m²)",
                  security_area: "0,39m x 0,59m",
                  impression: "UV 300dpi"
                  )

PanelType.create!(name: "Painel Backlight Super",
                  total_area: "2,56m x 1,32m",
                  visible_area: "2,46m x 1,22m (3,01m²)",
                  security_area: "2,40m x 1,16m ",
                  impression: "UV 300dpi"
                  )

PanelType.create!(name: "Painel Backlight Hiper",
                  total_area: "3,82m x 1,32m ",
                  visible_area: "3,72m x 1,22m (4,54m²)",
                  security_area: "3,66m x 1,16m ",
                  impression: "UV 300dpi"
                  )

PanelType.create!(name: "Painel Backlight Master ",
                  total_area: "4,97m x 2,79m ",
                  visible_area: "4,94m x 2,74m (13,54m²) ",
                  security_area: "4,80m x 2,70m",
                  impression: "UV 300dpi"
                  )

puts "Creating panels in 'Linha 1 Azul'"
random_panel_type = PanelType.all
random_line1_station = linha_azul.stations

10.times do
  Panel.create!(panel_type: random_panel_type.sample,
              station: random_line1_station.sample,
              price_cents: 100000)
end
puts "Creating panels in 'Linha 2 Verde'"

random_line2_station = linha_verde.stations
10.times do
  Panel.create!(panel_type: random_panel_type.sample,
                station: random_line2_station.sample,
                price_cents: 200000)
end

puts "Creating panels in 'Linha 3 Vermelha'"
random_line3_station = linha_vermelha.stations
10.times do
  Panel.create!(panel_type: random_panel_type.sample,
                station: random_line3_station.sample,
              price_cents: 300000)
end
puts "Creating panels in 'Linha 5 Lilás'"

random_line5_station = linha_lilas.stations
10.times do
  Panel.create!(panel_type: random_panel_type.sample,
                station: random_line5_station.sample,
                price_cents: 500000)
end
puts "Created #{Panel.count} panels"

puts "Creating test user"
cpf = CPF.generate
cnpj = CNPJ.generate
user = User.create!(email: 'teste@jcdeasy.com',
                    password: "123456",
                    cpf: cpf,
                    phone_number: "111111111",
                    first_name: "Teste",
                    last_name: "jcdeasy")

puts "Creating test user company"

Company.create!(user: user,
                cnpj: cnpj,
                name: "LeWagon",
                address1: "Rua Mourato Coelho",
                street_number: "1404",
                zip_code: "05417-000",
                city: "SP",
                state: "São Paulo")

