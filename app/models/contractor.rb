class Contractor < ApplicationRecord
  has_many :contact_numbers, as: :contactable, dependent: :destroy
  has_many :attachments, as: :attachable, dependent: :destroy
  has_many :contractor_services, dependent: :destroy
  has_many :services, through: :contractor_services
  has_many :technicians, dependent: :destroy

  has_and_belongs_to_many :biddings

  has_one :location, as: :locationable, dependent: :destroy
  has_one :user, as: :profileable, dependent: :destroy

  accepts_nested_attributes_for :user
  accepts_nested_attributes_for :contact_numbers
  accepts_nested_attributes_for :location
  accepts_nested_attributes_for :attachments
  accepts_nested_attributes_for :contractor_services
  #validates_presence_of :first_name, :last_name, :shop_name

  def latest_image
    attachments.present? ? attachments.last.document.url(:medium) : "#{APP_URL}/images/missing.png"
  end

  def full_name
    "#{self.first_name} #{self.last_name}".titleize
  end

  def initialize_nested
    self.contractor_services.build
    self.contractor_services.map &:initialize_nested
  end
end
