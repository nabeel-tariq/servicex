class Location < ApplicationRecord
  belongs_to :locationable, polymorphic: true
  belongs_to :city

  has_many :contact_numbers, as: :contactable, dependent: :destroy

  accepts_nested_attributes_for :contact_numbers
end
