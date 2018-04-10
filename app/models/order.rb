class Order < ApplicationRecord
  belongs_to :panel
  belongs_to :campaign

  validates :date, presence: true
  validates :duration, presence: true
  validates :quantity, presence: true
end
