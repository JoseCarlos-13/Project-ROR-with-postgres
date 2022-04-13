require 'rails_helper'
require 'support/request_helper_spec.rb'

RSpec.describe "Customers", type: :request do
  describe "GET#index" do
    context "when the customers are listed" do
      it "must return 200 status code" do
        customers = create_list(:customer, 2)

        get "/customers"

        expect(response).to have_http_status(:ok)
      end

      it "must list all customers" do
        customers = create_list(:customer, 2)

        get "/customers"

        expect(json_body[0]).to have_key(:id)
        expect(json_body[0]).to have_key(:name)
        expect(json_body[0]).to have_key(:email)
        expect(json_body[0]).to have_key(:age)
      end
    end
  end
end
