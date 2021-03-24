class Article < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true
  validates :author_id, presence: true

  belongs_to :author
end
