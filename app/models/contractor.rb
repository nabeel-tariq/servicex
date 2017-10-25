class Contractor < ApplicationRecord
  has_many :contact_numbers, as: :contactable, dependent: :destroy
  has_many :attachments, as: :attachable, dependent: :destroy
  has_many :contractor_services, dependent: :destroy
  has_many :services, through: :contractor_services

  has_and_belongs_to_many :biddings

  has_one :location, as: :locationable, dependent: :destroy
  has_one :user, as: :profileable, dependent: :destroy

  accepts_nested_attributes_for :user
  accepts_nested_attributes_for :contact_numbers
  accepts_nested_attributes_for :location
  accepts_nested_attributes_for :attachments

  #validates_presence_of :first_name, :last_name, :shop_name
end
