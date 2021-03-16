require 'rails_helper'
require 'support/request_helper_spec'

RSpec.describe "Authors", type: :request do
  describe "GET #index" do
    context 'when the author list is returned' do
      it 'must return 200 status code' do
        author = create_list(:author, 2)

        get '/authors'

        expect(response).to have_http_status(:ok)
      end

      it 'must return the author list' do
        authors = create_list(:author, 2)

        get '/authors'

        expect(json_body[0]).to have_key("id")
        expect(json_body[0]).to have_key("name")
        expect(json_body[0]).to have_key("articles")
      end
    end
  end
end
