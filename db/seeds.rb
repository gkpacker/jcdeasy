# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
linha_azul = Line.create!(name: "Linha 1 - Azul")
linha_verde = Line.create!(name: "Linha 2 - Verde")
linha_vermelha = Line.create!(name: "Linha 3 - Vermelha")
linha_lilas = Line.create!(name: "Linha 5 - Lilás")

jabaquara = Station.new(name: "Jabaquara", address: "Rua dos Jequitibás - Jabaquara, São Paulo - SP, 04309-011")
jabaquara.lines << linha_azul
jabaquara.save


