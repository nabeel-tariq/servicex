class LocationContractorService < ApplicationRecord
  belongs_to :contractor_service
  belongs_to :location

  validates_presence_of :contractor_service_id, :location_id
  validates_uniqueness_of :contractor_service_id, :scope => :location_id
end
