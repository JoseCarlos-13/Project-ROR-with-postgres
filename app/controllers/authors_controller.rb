class AuthorsController < ApplicationController
  def index
    @authors = Author.all

    @authors = @authors.search_author(params[:name])

    render json: @authors,
           each_serializer: Author::Index::AuthorSerializer,
           status: :ok
  end

  def show
    @author = Author.find(params[:id])

    render json: @author,
           serializer: Author::Show::AuthorSerializer,
           status: :ok
  end

  def create
    @author = Author.new(author_params)

    if @author.save
      render json: @author,
             serializer: Author::Create::AuthorSerializer,
             status: :created
    else
      render json: { error_message: "the name is null or invalid" },
             status: :unprocessable_entity
    end
  end

  def update
    @author = Author.find(params[:id])

    if @author.update(author_params)
      head :no_content
    else
      render json: { errors: @author.errors },
             status: :unprocessable_entity
    end
  end

  def destroy
    @author = Author.find(params[:id])

    @author.destroy!

    head :no_content
  end

  private

  def author_params
    params.require(:author).permit(:name, :author_image)
  end
end
