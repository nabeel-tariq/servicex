class TechnicianOrder < ApplicationRecord
  belongs_to :technician
  belongs_to :order

  validates_uniqueness_of :technician_id, :scope => :order_id
end
