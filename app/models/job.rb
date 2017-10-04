class Job < ApplicationRecord
  has_many :biddings, dependent: :destroy

  has_one :order, dependent: :destroy

  belongs_to :employer
end
