class Bidding < ApplicationRecord
  belongs_to :job

  has_many :attachments, as: :attachable, dependent: :destroy

  has_and_belongs_to_many :contractors

  has_one :order, dependent: :destroy

  validates_presence_of :job_id, :description, :amount, :time

  accepts_nested_attributes_for :attachments
end