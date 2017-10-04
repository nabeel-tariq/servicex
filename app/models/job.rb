class Job < ApplicationRecord
  has_many :biddings, dependent: :destroy

  has_one :order, dependent: :destroy

  belongs_to :employer

  validates_presence_of :name, :description, :employer_id
end
