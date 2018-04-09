class Panel < ApplicationRecord
  has_one :panel_type
  has_many :stations
end
