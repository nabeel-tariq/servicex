class User < ApplicationRecord
  belongs_to :profileable, polymorphic: true
end
