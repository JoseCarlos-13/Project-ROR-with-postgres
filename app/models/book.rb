class Book < ApplicationRecord
  validates :title, presence: true
  validates :sinopsis, presence: true
  validates :release_date, presence: true
  validates :author_id, presence: true

  belongs_to :author
end
