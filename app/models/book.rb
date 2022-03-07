class Book < ApplicationRecord
  validates :title, presence: true
  validates :sinopsis, presence: true
  validates :release_date, presence: true
  validates :author_id, presence: true

  has_one_attached :book_cover

  belongs_to :author

  def image_url
    Rails.application.routes.url_helpers.rails_blob_path(self.book_cover, only_path: true)
  end
end
