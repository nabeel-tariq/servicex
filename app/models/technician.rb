class Technician < ApplicationRecord
  has_many :contact_numbers, as: :contactable, dependent: :destroy
  has_many :attachments, as: :attachable, dependent: :destroy
  has_many :technician_orders, dependent: :destroy
  has_many :orders, through: :technician_orders

  has_one :location, as: :locationable, dependent: :destroy
  has_one :user, as: :profileable, dependent: :destroy

  accepts_nested_attributes_for :user
  accepts_nested_attributes_for :contact_numbers
  accepts_nested_attributes_for :location
  accepts_nested_attributes_for :attachments

  validates_presence_of :first_name, :last_name, :shop_name
end
