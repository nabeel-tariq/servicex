class LocationContractorService < ApplicationRecord
  belongs_to :contractor_service

  has_one :location, as: :locationable, dependent: :destroy

  #validates_presence_of :contractor_service_id
  validates_uniqueness_of :contractor_service_id

  accepts_nested_attributes_for :location
end
