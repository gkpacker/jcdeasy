class Panel < ApplicationRecord
  belongs_to :panel_type
  belongs_to :station
  has_many :orders

  monetize :price_cents

  validates :price_cents, presence: true

  include PgSearch
  pg_search_scope :station_search,
                  associated_against: {
                    station: [ :name ]
                  },
                  using: {
                    tsearch: { prefix: true }
                  }
end
