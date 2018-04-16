class Order < ApplicationRecord
  mount_uploader :art, ArtUploader

  belongs_to :panel
  belongs_to :campaign

  monetize :price_cents

  validates :price_cents, presence: true

  validates :date, presence: true, uniqueness: { scope: [:campaign, :panel] }
  validates :duration, presence: true

  def cover?
    end_date = date.to_date + duration
    panel.calculate_dates.each do |date|
      range = (date[:from].to_date..date[:to].to_date)
      return true if range.cover?(end_date)
    end
    return false
  end
end
