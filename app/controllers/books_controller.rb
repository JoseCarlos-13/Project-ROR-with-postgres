class BooksController < ApplicationController
  def index
    @books = Book.all.includes(:author)

    @books = @books.search_book(params[:title])

    render json: @books,
           each_serializer: Book::Index::BooksSerializer,
           status: :ok
  end

  def show
    @book = Book.find(params[:id])

    render json: @book,
           serializer: Book::Show::BooksSerializer,
           status: :ok
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      render json: @book,
             serializer: Book::Create::BooksSerializer,
             status: :created
    else
      render json: { errors: @book.errors.messages },
             status: :unprocessable_entity
    end
  end

  def update
    @book = Book.find(params[:id])

    if @book.update(book_params)
      head :no_content
    else
      render json: { errors: @book.errors.messages },
             status: :unprocessable_entity
    end
  end

  def destroy
    @book = Book.find(params[:id])

    @book.destroy

    head :no_content
  end

  def book_params
    params.require(:book).permit(:title, :sinopsis, :release_date,
                                 :author_id, :book_cover)
  end
end
