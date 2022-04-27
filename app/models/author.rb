class Author < ApplicationRecord
  include Rails.application.routes.url_helpers

  validates :name, presence: true

  has_many :books, dependent: :destroy

  has_one_attached :author_image

  scope :search_author, -> (author_name) { where("name like ?", "%#{author_name}%") if author_name.present? }

  def image_url
    author_image_url = rails_blob_path(self.author_image, only_path: true)

    "#{ENV['BASE_URL']}#{author_image_url}" if self.author_image.attached?
  end
end
