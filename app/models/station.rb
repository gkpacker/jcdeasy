class Station < ApplicationRecord
  belongs_to :stations_lines
  belongs_to :panel

  has_many :lines, through: :stations_lines
end
