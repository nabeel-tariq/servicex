class Question < ApplicationRecord
  enum question_type: { textbox: 0, dropdown: 1, checkbox: 2, radio: 3, text_area:4 }
  enum status: {active: 0, inactive: 1}

  has_many :question_services, dependent: :destroy
  has_many :services, through: :question_services
  attr_accessor :answers


  before_validation :set_defaults

  private


  def set_defaults
    self.values = self.answers.split "\r\n" if self.answers.present?
  end

end
