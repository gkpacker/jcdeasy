class Order < ApplicationRecord
  belongs_to :panel
  belongs_to :campaign
end
