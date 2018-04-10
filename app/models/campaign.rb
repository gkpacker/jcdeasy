class Campaign < ApplicationRecord
  belongs_to :company
  has_many :orders
end
