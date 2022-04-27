class Operator < ApplicationRecord
  validates :email, presence: true, uniqueness: true
end
