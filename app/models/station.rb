class Station < ApplicationRecord
  has_many :panels
  has_many :stations_lines
  has_many :lines, through: :stations_lines

  validates :name, presence: true, uniqueness: true
  validates :address, presence: true, uniqueness: true
end
