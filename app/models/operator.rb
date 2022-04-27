class Operator < ApplicationRecord
  validate :email, presence: true, uniqueness: true
end
