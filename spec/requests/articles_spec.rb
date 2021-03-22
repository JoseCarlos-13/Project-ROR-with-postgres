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
end
