class BooksController < ApplicationController
  def index
    @books = Book.all

    render json: @books,
           each_serializer: Book::Index::BookSerializer, status: :ok
  end
end
