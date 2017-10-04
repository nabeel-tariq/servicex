class Order < ApplicationRecord
  has_many :payments, dependent: :destroy
  has_many :technician_orders, dependent: :destroy
  has_many :technician, through: :technician_orders

  belongs_to :contractor
  belongs_to :job
  belongs_to :bidding

end
