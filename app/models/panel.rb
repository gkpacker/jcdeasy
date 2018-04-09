class Panel < ApplicationRecord
  belongs_to :panel_type
  belongs_to :station
  has_many :orders

  monetize :price_cents
end
