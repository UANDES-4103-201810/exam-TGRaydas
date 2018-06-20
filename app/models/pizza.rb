class Pizza < ApplicationRecord
  belongs_to :crust
  belongs_to :recipe
  has_one :photo
end
