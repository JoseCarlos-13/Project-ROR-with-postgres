require 'rails_helper'
require 'support/request_helper_spec.rb'

RSpec.describe "Customers", type: :request do
  describe "GET#index" do
    context "when the customers are listed" do
      it "must return 200 status code and the customers list" do
        customers = create_list(:customer, 2)

        get "/customers"

        expect(response).to have_http_status(:ok)
        expect(json_body[0]).to have_key(:id)
        expect(json_body[0]).to have_key(:name)
        expect(json_body[0]).to have_key(:email)
        expect(json_body[0]).to have_key(:age)
      end
    end
  end

  describe "GET#show" do
  context "when one customer is selected" do
    it "must return 200 status code and the customers selected" do
      customer = create(:customer)

      get "/customers/#{customer.id}"

      expect(response).to have_http_status(:ok)
      expect(json_body).to have_key(:id)
      expect(json_body).to have_key(:name)
      expect(json_body).to have_key(:email)
      expect(json_body).to have_key(:age)
    end
  end
end
end
