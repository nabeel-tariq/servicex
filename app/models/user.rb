class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,:omniauthable, omniauth_providers: [:facebook, :google_oauth2]
  belongs_to :contractor
  belongs_to :employer
  #belongs_to :profileable, polymorphic: true
  has_many :authentications
  enum account_stage: {incomplete: 0, complete: 1}
  after_create :handle_profileables
  alias_attribute :name, :full_name
  acts_as_messageable

  def handle_profileables
    employer = Employer.create(first_name: self.first_name, last_name: self.last_name)
    contractor = Contractor.create(first_name: self.first_name, last_name: self.last_name)
    self.update(contractor_id: contractor.id,employer_id: employer.id) if employer && contractor
  end

  def full_name
    "#{self.first_name} #{self.last_name}".titleize
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

  def is_admin?
    self.email == "admin@servicex.com" ? true : false
  end
end
