class Line < ApplicationRecord
  belongs_to :stations_lines
  has_many :stations, through: :stations_lines
end
