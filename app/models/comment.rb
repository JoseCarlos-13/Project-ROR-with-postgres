class Comment < ApplicationRecord
  belongs_to :customer

  validates :content, presence: true
end
