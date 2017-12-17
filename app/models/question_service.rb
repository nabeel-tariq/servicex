class QuestionService < ApplicationRecord
  belongs_to :question
  belongs_to :service
end
