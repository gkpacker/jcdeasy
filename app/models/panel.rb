class Panel < ApplicationRecord
  paginates_per 24
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


  def calculate_dates
    dates = []
    self.orders.includes(:campaign).each do |order|
      if order.campaign.paid
        start_date = order.date.to_date
        dates << { from: start_date.strftime("%d/%m/%Y"),
                  to: (start_date + order.duration).strftime("%d/%m/%Y")
                  }
      end
    end
    dates
  end

end
