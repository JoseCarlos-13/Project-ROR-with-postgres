class Book::Create::BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :author, :release_date, :sinopsis, :book_cover

  def author
    object.author.name
  end

  def book_cover
    object.image_url
  end
end
