class ContactNumber < ApplicationRecord
  belongs_to :contactable, polymorphic: true
  validates_presence_of :job_id, :text_value
end
