require 'rails_helper'
require 'support/request_helper_spec'

RSpec.describe "Books", type: :request do
  describe "GET#index" do
    context "when the books list is loaded" do
      it "must return status code 200" do
        author = create(:author)
        books = create_list(:book, 3, author_id: author.id)

        get "/books"

        expect(response).to have_http_status(:ok)
      end

      it "must return the book list" do
        author = create(:author)
        books = create_list(:book, 3, author_id: author.id)

        get "/books"

        expect(json_body[0]).to include(:id, :title, :author, :release_date)
      end
    end
  end
end
