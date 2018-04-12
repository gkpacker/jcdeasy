class Order < ApplicationRecord
  belongs_to :panel
  belongs_to :campaign

  monetize :price_cents

  validates :price_cents, presence: true

  validates :date, presence: true
  validates :duration, presence: true
end
