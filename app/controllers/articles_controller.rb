class ArticlesController < ApplicationController
  def index
    articles = Article.all

    render json: articles,
           each_serializer: Index::ArticleSerializer, status: :ok
  end
end
