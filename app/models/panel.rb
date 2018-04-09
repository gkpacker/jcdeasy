class Panel < ApplicationRecord
  belongs_to :panel_type
  belongs_to :station
end
