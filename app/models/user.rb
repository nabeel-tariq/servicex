class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :profileable, polymorphic: true

  enum account_stage: {incomplete: 0, complete: 1}

  def full_name
    "#{self.first_name} #{self.first_name}".titleize
  end
end
