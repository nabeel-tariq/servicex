class ContractorService < ApplicationRecord
  has_many :locations, -> {order(:created_at)}, as: :locationable

  belongs_to :contractor
  belongs_to :service

  accepts_nested_attributes_for :locations

  #validates_presence_of :contractor, :service
  validates_uniqueness_of :contractor_id, :scope => :service_id


  def initialize_nested
    self.locations.build
  end


  def ordered_locations
    locations.sort_by &:id
  end
end