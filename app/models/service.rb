class Service < ApplicationRecord
  belongs_to :service_category

  has_many :contractor_services, dependent: :destroy
  has_many :contractors, through: :contractor_services
end
