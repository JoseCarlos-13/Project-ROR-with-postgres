class AuthorsController < ApplicationController
  def index
    authors = Author.all

    render json: authors,
           each_serializer: Index::AuthorSerializer, status: :ok
  end

  def create
    author = Author.new(author_params)

    if author.save
      render json: author,
             serializer: Create::AuthorSerializer, status: :created
    else
      render json: { message: "Error on the author creation" }, status: :unprocessable_entity
    end
  end

  def author_params
    params.require(:author).permit(:name)
  end
end
