require 'rails_helper'
require 'support/request_helper_spec'

RSpec.describe "Articles", type: :request do
  describe "GET /index" do
    context 'when return the article list' do
      it 'must return 200 status code' do
        author = create(:author)
        articles = create_list(:article, 2, author_id: author.id)

        get '/articles'

        expect(response).to have_http_status(:ok)
      end

      it 'must return the article list' do
        author = create(:author)
        articles = create_list(:article, 2, author_id: author.id)

        get '/articles'

        expect(json_body[0]).to have_key(:id)
        expect(json_body[0]).to have_key(:title)
        expect(json_body[0]).to have_key(:body)
      end
    end
  end

  describe 'POST #create' do
    context 'when the article is created' do
      it 'must return the 201 status code' do
        author = create(:author)
        article_params = attributes_for(:article, title: 'o iluminado', 
          body: 'lorem ipsum text body', author_id: author.id)

        post '/articles', params: { article: article_params }

        expect(response).to have_http_status(:created)
      end

      it 'must return the article created' do
        author = create(:author)
        article_params = attributes_for(:article, title: 'o iluminado', 
          body: 'lorem ipsum text body', author_id: author.id)

        post '/articles', params: { article: article_params }

        expect(json_body).to have_key(:id)
        expect(json_body).to have_key(:title)
        expect(json_body).to have_key(:body)
        expect(json_body).to have_key(:author_id)
      end
    end

    context 'when the article is not created' do
      it 'must return the 422 status code' do
        article_params = attributes_for(:article, title: nil, 
          body: nil, author_id: nil)

        post '/articles', params: { article: article_params }

        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'must return the error message' do
        article_params = attributes_for(:article, title: nil, 
          body: nil, author_id: nil)

        post '/articles', params: { article: article_params }

        expect(json_body).to have_key(:errors)
      end
    end
  end

  describe 'PUT #update' do
    context 'when the article is updated' do
      it 'must return 204 status code' do
        author = create(:author)
        article = create(:article, author_id: author.id)
        article_params = attributes_for(:article, title: 'article 1', body: 'lorem ipsum text')

        put "/articles/#{article.id}", params: { article: article_params }

        expect(response).to have_http_status(:no_content)
      end
    end

    context 'when the article is not updated' do
      it 'must return 422 status code' do
        author = create(:author)
        article = create(:article, author_id: author.id)
        article_params = attributes_for(:article, title: nil, body: nil)

        put "/articles/#{article.id}", params: { article: article_params }

        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'must return the error message' do
        author = create(:author)
        article = create(:article, author_id: author.id)
        article_params = attributes_for(:article, title: nil, body: nil)

        put "/articles/#{article.id}", params: { article: article_params }

        expect(json_body).to have_key(:errors)
      end
    end
  end

  describe 'GET #show' do
    context 'when the article is found' do
      it 'must return 200 status code' do
        author = create(:author)
        article = create(:article, title: 'title 3', body: 'lorem ipsum 3', author_id: author.id)

        get "/articles/#{article.id}"

        expect(response).to have_http_status(:ok)
      end

      it 'must return the article' do
        author = create(:author)
        article = create(:article, title: 'title 3', body: 'lorem ipsum 3', author_id: author.id)

        get "/articles/#{article.id}"

        expect(json_body).to have_key(:id)
        expect(json_body).to have_key(:title)
        expect(json_body).to have_key(:body)
      end
    end
  end
end
