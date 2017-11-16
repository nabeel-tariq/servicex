class Job < ApplicationRecord
  has_many :attachments, as: :attachable, dependent: :destroy
  has_many :biddings, dependent: :destroy
  has_many :jobs_services, dependent: :destroy
  has_many :services, through: :jobs_services
  has_many :orders, dependent: :destroy

  has_one :location, as: :locationable, dependent: :destroy

  belongs_to :employer

  accepts_nested_attributes_for :contact_numbers
  accepts_nested_attributes_for :attachments
  accepts_nested_attributes_for :location
  accepts_nested_attributes_for :jobs_services

  validates_presence_of :name, :description, :employer_id

  def initialize_nested_attri
    self.contact_numbers.length > 0 ? self.contact_numbers : self.contact_numbers.build
    self.attachments.length > 0 ? self.attachments : self.attachments.build
    self.location ||= Location.new
    self.jobs_services.length > 0 ? self.jobs_services : self.jobs_services.build
    self
  end

end