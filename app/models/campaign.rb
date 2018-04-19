class Campaign < ApplicationRecord
  enum status: [ :active, :archived ]
  belongs_to :company
  has_many :orders

  validates :title, presence: true
end
