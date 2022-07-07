require 'rails_helper'
require 'support/request_helper_spec'

RSpec.describe "Comments", type: :request do
  describe "GET /index" do
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
end
