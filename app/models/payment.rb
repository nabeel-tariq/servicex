class Payment < ApplicationRecord
  belongs_to :order
  validates_presence_of :order_id
end
