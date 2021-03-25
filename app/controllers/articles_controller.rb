class ArticlesController < ApplicationController
  def index
    articles = Article.all

    render json: articles,
           each_serializer: Index::ArticleSerializer, status: :ok
  end

  def create
    article = Article.new(article_params)

    if article.save
      render json: article,
             serializer: Create::ArticleSerializer, status: :created
    else
      render json: { errors: article.errors },
             status: :unprocessable_entity
    end
  end

  def article_params
    params.require(:article).permit(:title, :body, :author_id)
  end
end
