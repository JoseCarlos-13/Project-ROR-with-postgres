require 'rails_helper'
require 'support/request_helper_spec'

RSpec.describe "Comments", type: :request do
  describe "GET#index" do
    context "when the comments are listed" do
      it "must return the status code" do
        customer = create(:customer)
        comments = create_list(:comment, 2, customer_id: customer.id)

        get "/comments"

        expect(response).to have_http_status(:ok)
      end

      it "must return the comments" do
        customer = create(:customer)
        comments = create_list(:comment, 2, customer_id: customer.id)

        get "/comments"

        expect(json_body[0]).to include(:id, :content, :customer_id)
      end
    end
  end

  describe "GET#show" do
    context "when a comment is selected" do
      it "must return the status code" do
        customer = create(:customer)
        comment = create(:comment, customer_id: customer.id)

        get "/comments/#{comment.id}"

        expect(response).to have_http_status(:ok)
      end

      it "must return the comment selected" do
        customer = create(:customer)
        comment = create(:comment, customer_id: customer.id)

        get "/comments/#{comment.id}"

        expect(json_body).to include(:id, :content, :customer_id)
      end
    end
  end

  describe "DELETE#destroy" do
    context "when a comment is deleted" do
      it "must return the status code" do
        customer = create(:customer)
        comment = create(:comment, customer_id: customer.id)

        delete "/comments/#{comment.id}"

        expect(response).to have_http_status(:no_content)
      end

      it "must delete the comment" do
        customer = create(:customer)
        comment = create(:comment, customer_id: customer.id)

        delete "/comments/#{comment.id}"

        expect(Customer.last.comments.count).to eq(0)
      end
    end
  end
end
