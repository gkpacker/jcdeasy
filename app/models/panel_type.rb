class PanelType < ApplicationRecord
  has_many :panels

  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :total_area, presence: true
  validates :visible_area, presence: true
  validates :security_area, presence: true
  validates :impression, presence: true

  monetize :price_cents
end
