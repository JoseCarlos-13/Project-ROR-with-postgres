class AuthorsController < ApplicationController
  def index
    authors = Author.all

    render json: authors,
           each_serializer: Index::AuthorSerializer, status: :ok
  end

  def create
    author = Author.create!(author_params)
    
    author.save

    render json: author,
           serializer: Create::AuthorSerializer, status: :created
  end

  def author_params
    params.require(:author).permit(:name)
  end
end
