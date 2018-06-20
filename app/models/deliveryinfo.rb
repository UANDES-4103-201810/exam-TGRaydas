class Deliveryinfo < ApplicationRecord
  belongs_to :order
  validates :line1, presence: true
  validates :line2, presence: true
  validates :phone, numericality: true
end
