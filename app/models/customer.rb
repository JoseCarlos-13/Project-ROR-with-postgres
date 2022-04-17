class Customer < ApplicationRecord
  validates :name, presence: true
  validates :age, presence: true
  validates :email, presence: true, uniqueness: true
end