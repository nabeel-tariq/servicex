class JobsService < ApplicationRecord
  belongs_to :job
  belongs_to :service
end
