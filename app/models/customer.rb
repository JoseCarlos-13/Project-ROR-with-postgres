class Customer < ApplicationRecord
  include Rails.application.routes.url_helpers

  validates :name, presence: true
  validates :age, presence: true
  validates :email, presence: true, uniqueness: true
  has_many :comments, dependent: :destroy

  has_one_attached :customer_image

  def image_url
    customer_image_url = rails_blob_path(self.customer_image, only_path: true)

    "#{ENV['BASE_URL']}#{customer_image_url}" if self.customer_image.attached?
  end
end
