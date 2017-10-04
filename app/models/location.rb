class Location < ApplicationRecord
  belongs_to :locationable, polymorphic: true
  has_many :location_contractor_services
  has_many :contractor_services, through: :location_contractor_services
  has_many :contact_numbers, as: :contactable, dependent: :destroy


  accepts_nested_attributes_for :contact_numbers
end
