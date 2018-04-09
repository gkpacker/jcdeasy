class Line < ApplicationRecord
  has_many :stations_lines
  has_many :stations, through: :stations_lines
end
