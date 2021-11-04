class Book::Index::BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :author, :release_date

  def author
    object.author.name
  end
end
