class BooksController < ApplicationController
  def index
    @books = Book.all

    render json: @books,
           each_serializer: Book::Index::BookSerializer, status: :ok
  end

  def show
    @book = Book.find(params[:id])

    render json: @book,
           serializer: Book::Show::BookSerializer, status: :ok
  end
end
