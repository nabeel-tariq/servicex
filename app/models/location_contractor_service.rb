class LocationContractorService < ApplicationRecord
  belongs_to :contractor_service
  belongs_to :location

  validates_uniqueness_of :contractor_service_id, :scope => :location_id
end
