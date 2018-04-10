class Line < ApplicationRecord
  has_many :stations_lines
  has_many :stations, through: :stations_lines, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
