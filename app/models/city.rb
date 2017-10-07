class City < ApplicationRecord
  has_many :locations, dependent: :destroy

  belongs_to :state
end
