class Order < ApplicationRecord
  has_many :payments, dependent: :destroy
  has_many :technician_orders, dependent: :destroy
  has_many :technician, through: :technician_orders

  belongs_to :job
  belongs_to :bidding

  validates_presence_of :contractor_id, :job_id, :bidding_id
end
