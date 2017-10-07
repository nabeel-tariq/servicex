class Service < ApplicationRecord
  belongs_to :service_category

  has_many :contractor_services, dependent: :destroy
  has_many :contractors, through: :contractor_services
  has_many :jobs_services, dependent: :destroy
  has_many :jobs, through: :jobs_services
end
