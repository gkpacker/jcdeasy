class Station < ApplicationRecord
  has_many :panels
  has_many :stations_lines
  has_many :lines, through: :stations_lines
end
