class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,:omniauthable, omniauth_providers: [:facebook, :google_oauth2]
  has_one :contractor
  has_one :employer
  #belongs_to :profileable, polymorphic: true
  has_many :authentications
  enum account_stage: {incomplete: 0, complete: 1}
  after_create :handle_profileables

  def self.create_from_provider_data(provider_data)
    where(provider: provider_data.provider, uid: provider_data.uid).first_or_create! do | user |
      if user.profileable_type.present?
      else
        employer = Employer.create(first_name: provider_data.info.name.split[0], last_name: provider_data.info.name.split[1], is_active: true)
        user.profileable_type = 'Employer'
        user.profileable_id = employer.id
      end
      user.email = provider_data.info.email
      user.password = Devise.friendly_token[0, 20]
      #user.skip_confirmation!
    end
  end

  def handle_profileables
    employer = Employer.create(first_name: self.first_name, last_name: self.last_name)
    contractor = Contractor.create(first_name: self.first_name, last_name: self.last_name)
    self.update(contractor_id: contractor.id,employer_id: employer.id) if employer && contractor
  end

  def full_name
    "#{self.first_name} #{self.last_name}".titleize
  end

  def is_employer?
    return true if self.profileable_type == 'Employer'
    return false
  end

  def is_contractor?
    return true if self.profileable_type == 'Contractor'
    return false
  end

  def apply_omniauth(omniauth)
    authentications.build(:provider => omniauth['provider'], :uid => omniauth['uid'])
  end

  def password_required?
    (authentications.empty? || !password.blank?) && super
  end

  def existing_auth_providers
    ps = self.authentications.all

    if ps.size > 0
      return ps.map(&:provider)
    else
      return []
    end
  end
end
