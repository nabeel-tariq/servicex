class Location < ApplicationRecord
  belongs_to :locationable, polymorphic: true, required: false
  belongs_to :city, required: false

  has_many :contact_numbers, as: :contactable, dependent: :destroy

  accepts_nested_attributes_for :contact_numbers
end
