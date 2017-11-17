class Employer < ApplicationRecord
  has_many :contact_numbers, as: :contactable, dependent: :destroy
  has_many :attachments, as: :attachable, dependent: :destroy
  has_many :jobs, dependent: :destroy

  has_one :location, as: :locationable, dependent: :destroy
  has_one :user, as: :profileable, dependent: :destroy

  accepts_nested_attributes_for :user
  accepts_nested_attributes_for :contact_numbers , reject_if: proc { |attributes| attributes[:text_value].blank? }
  accepts_nested_attributes_for :location
  accepts_nested_attributes_for :attachments

  #validates_presence_of :first_name, :last_name

  def update_profile_stage
    self.user.complete!
  end

  def latest_image
    attachments.present? ? attachments.last.document.url(:thumb) : "#{APP_URL}/images/missing.png"
  end

  def full_name
    "#{self.first_name} #{self.last_name}".titleize
  end

  def get_contact_numbers
    self.profileable.contact_numbers
  end

  def address
    self.profileable.location.name
  end
end
