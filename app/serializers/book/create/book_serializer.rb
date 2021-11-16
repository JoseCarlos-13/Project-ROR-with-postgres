class Book::Create::BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :author, :release_date, :sinopsis

  def author
    object.author.name
  end
end
