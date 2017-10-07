class Attachment < ApplicationRecord
  belongs_to :attachable, polymorphic: true
  validates_presence_of :name, :image_type
end
