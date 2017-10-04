class ContactNumber < ApplicationRecord
  belongs_to :contactable, polymorphic: true
end
