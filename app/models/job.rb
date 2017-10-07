class Job < ApplicationRecord
  has_many :attachments, as: :attachable, dependent: :destroy
  has_many :biddings, dependent: :destroy
  has_many :jobs_services, dependent: :destroy
  has_many :services, through: :jobs_services
  has_many :orders, dependent: :destroy

  has_one :location, as: :locationable, dependent: :destroy

  belongs_to :employer

  accepts_nested_attributes_for :attachments
  accepts_nested_attributes_for :location

  validates_presence_of :name, :description, :employer_id
end
