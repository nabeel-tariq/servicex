class Bidding < ApplicationRecord
  belongs_to :job
  belongs_to :contractor_service

  has_one :order, dependent: :destroy
  validates_presence_of :job_id, :contractor_service_id
  validates_uniqueness_of :job_id, :scope => :contractor_service_id
end
