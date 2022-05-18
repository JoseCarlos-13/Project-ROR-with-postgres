class Book < ApplicationRecord
  include Rails.application.routes.url_helpers

  validates :title, presence: true
  validates :sinopsis, presence: true
  validates :release_date, presence: true
  validates :author_id, presence: true

  has_one_attached :book_cover

  belongs_to :author

  scope :search_book, -> (book_title) {
    where("title like ?", "%#{book_title}%") if book_title.present?
  }

  def image_url
    book_cover_url = rails_blob_path(self.book_cover, only_path: true)

    "#{ENV['BASE_URL']}#{book_cover_url}" if self.book_cover.attached?
  end
end
