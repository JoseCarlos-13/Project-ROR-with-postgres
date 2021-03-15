class AuthorsController < ApplicationController
  def index
    authors = Author.all

    render json: authors,
           each_serializer: Index::AuthorSerializer, status: :ok
  end
end
