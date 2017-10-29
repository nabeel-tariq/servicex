class ContactNumber < ApplicationRecord
  belongs_to :contactable, polymorphic: true, required: false
  #validates_presence_of :job_id, :text_value, :number_type
end
