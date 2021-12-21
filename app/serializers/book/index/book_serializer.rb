class Book::Index::BookSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :title, :author, :release_date, :sinopsis, :book_cover

  def author
    object.author.name
  end

  def book_cover
    rails_blob_path(object.book_cover, only_path: true)
  end
end
