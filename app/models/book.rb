class Book < ApplicationRecord
  include Rails.application.routes.url_helpers

  validates :title, presence: true
  validates :sinopsis, presence: true
  validates :release_date, presence: true
  validates :author_id, presence: true

  has_one_attached :book_cover

  belongs_to :author

  def image_url
    base_url = ENV['BASE_URL']
    book_cover_url = rails_blob_path(self.book_cover, only_path: true)

    "#{base_url}#{book_cover_url}" if self.book_cover.attached?
  end
end
