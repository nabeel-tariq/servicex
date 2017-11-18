class Job < ApplicationRecord
  has_many :attachments, as: :attachable, dependent: :destroy
  has_many :biddings, dependent: :destroy
  has_many :jobs_services, dependent: :destroy
  has_many :services, through: :jobs_services
  has_many :orders, dependent: :destroy

  has_one :location, as: :locationable, dependent: :destroy

  belongs_to :employer

  enum ad_type: {personal: 0, business: 1}

  accepts_nested_attributes_for :attachments
  accepts_nested_attributes_for :location
  accepts_nested_attributes_for :jobs_services

  validates_presence_of :name, :description, :employer_id

  def initialize_nested_attri
    self.attachments.length > 0 ? self.attachments : self.attachments.build
    self.location ||= Location.new
    self.jobs_services.length > 0 ? self.jobs_services : self.jobs_services.build
    self
  end

  def latest_image
    attachments.present? ? attachments.last.document.url(:thumb) : "#{APP_URL}/images/missing.png"
  end

end