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

  describe "POST#create" do
    context "when the customer is created" do
      it "must return 201 status code and the customer created" do
        customer_params = attributes_for(:customer, name: "John Doe",
                                         email: "johndoe@gmail.com", age: 21)

        post "/customers", params: { customer: customer_params }

        expect(response).to have_http_status(:created)
        expect(json_body).to have_key(:id)
        expect(json_body).to have_key(:name)
        expect(json_body).to have_key(:email)
        expect(json_body).to have_key(:age)
      end
    end

    context "when the customer is not created" do
      it "must return 422 status code and error message" do
        customer_params = attributes_for(:customer, name: nil,
                                         email: nil, age: nil)

        post "/customers", params: { customer: customer_params }

        expect(response).to have_http_status(:unprocessable_entity)
        expect(json_body).to have_key(:errors)
      end
    end
  end

  describe "PUT#update" do
    context "when the selected customer is updated" do
      it "must return 204 status code" do
        customer = create(:customer)
        new_customer_params = attributes_for(:customer, name: "John Doe",
                                             email: "johndoe@gmail.com", age: 23)

        put "/customers/#{customer.id}", params: { customer: new_customer_params }

        expect(response).to have_http_status(:no_content)
      end
    end
  end
end
