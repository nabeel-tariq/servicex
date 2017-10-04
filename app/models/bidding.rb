class Bidding < ApplicationRecord
  belongs_to :job
  belongs_to :contractor_service

  has_one :order, dependent: :destroy
end
