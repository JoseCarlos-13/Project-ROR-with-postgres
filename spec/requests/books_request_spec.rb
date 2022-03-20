require 'rails_helper'
require 'support/request_helper_spec'

RSpec.describe "Books", type: :request do
  describe "GET#index" do
    context "when the books list is loaded" do
      let(:author) { create(:author) }
      let(:books) { create_list(:book, 3, author_id: author.id) }

      before do
        books

        get books_path
      end

      it "must return status code 200" do
        expect(response).to have_http_status :ok
      end

      it "must return the book list" do
        expect(json_body[0]).to include(:id, :author, :title, :sinopsis,
                                        :release_date, :book_cover)
      end
    end
  end

  describe "POST#create" do
    context "when the book is created" do
      let(:author) { create(:author) }
      let(:book_cover_image) {
        fixture_file_upload(
          Rails.root.join("app", "assets", "images", "ruby_symbol.png"),
          'image/png'
        )
      }
      let(:book_params) { attributes_for(:book, title: "myString",
                                                author_id: author.id,
                                                sinopsis: "myString",
                                                release_date: "2021-11-05",
                                                book_cover: book_cover_image) }

      before do
        book_params

        post books_path, params: { book: book_params }
      end

      it "must return 201 status code" do
        expect(response).to have_http_status :created
      end

      it "must return the book created" do
        expect(json_body).to include(:id, :author, :title, :sinopsis,
                                     :release_date, :book_cover)
      end
    end

    context "when the book is not created" do
      let(:author) { create(:author) }
      let(:book_params) { attributes_for(:book, title: nil, sinopsis: nil,
                                                author_id: author.id,
                                                release_date: nil,
                                                book_cover: nil) }

      before do
        book_params

        post books_path, params: { book: book_params }
      end

      it "must return 422 status code" do
        expect(response).to have_http_status :unprocessable_entity
      end

      it "must return the message error" do
        expect(json_body).to include(:errors)
      end
    end
  end

  describe "GET#show" do
    context "when a book is chosed" do
      let(:author) { create(:author) }
      let(:book) { create(:book, author_id: author.id) }

      before do
        book

        get "/books/#{book.id}"
      end

      it "must return 200 status code" do
        expect(response).to have_http_status :ok
      end

      it "must return the book selected" do
        expect(json_body).to include(:id, :author, :title, :sinopsis,
                                     :release_date, :book_cover)
      end
    end
  end
end
