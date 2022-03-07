class Book::Index::BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :author, :release_date, :sinopsis, :book_cover

  def author
    object.author.name
  end

  def book_cover
    "#{ENV['BASE_URL']}#{object.image_url}" if object.book_cover.attached?
  end
end
