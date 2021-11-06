class BooksController < ApplicationController
  def index
    @books = Book.all

    render json: @books,
           each_serializer: Book::Index::BookSerializer, status: :ok
  end

  def create
    @book = Book.new(book_params)

    if @book.valid?
      @book.save
      render json: @book,
             serializer: Book::Create::BookSerializer, status: :created
    else
      render json: { errors: @book.errors.messages }, status: :unprocessable_entity
    end
  end

  def book_params
    params.require(:book).permit(:title, :sinopsis, :release_date, :author_id)
  end
end
