class TechnicianOrder < ApplicationRecord
  belongs_to :technician
  belongs_to :order

  validates_presence_of :technician_id, :order_id
  validates_uniqueness_of :technician_id, :scope => :order_id
end
