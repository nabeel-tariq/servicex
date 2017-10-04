class ContractorService < ApplicationRecord
  has_many :location_contractor_services
  has_many :locations, through: :location_contractor_services
  has_many :biddings, dependent: :destroy

  belongs_to :contractor
  belongs_to :service

  validates_presence_of :contractor, :service
  validates_uniqueness_of :contractor_id, :scope => :service_id
end