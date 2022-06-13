require 'rails_helper'
require 'support/request_helper_spec'

RSpec.describe "Operators", type: :request do
  describe "GET #index" do
    context "when return a operators list" do
      it "must return the list" do
        operators = create_list(:operator, 2)

        get "/operators"

        expect(response).to have_http_status(:ok)
        expect(json_body[0]).to include(:id, :name, :email)
      end
    end
  end

  describe "GET #show" do
    context "when return a operators list" do
      it "must return the list" do
        operator = create(:operator)

        get "/operators/#{operator.id}"

        expect(response).to have_http_status(:ok)
        expect(json_body).to include(:id, :name, :email)
      end
    end
  end

  describe "POST #create" do
    context "when a operator is created" do
      it "must return the operator created" do
        operator_attributes = attributes_for(:operator)

        post "/operators", params: { operator: operator_attributes }

        expect(response).to have_http_status(:created)
        expect(json_body).to include(:id, :name, :email)
      end
    end

    context "when a operator attribute is empty or invalid" do
      it "must return the operator created" do
        operator_attributes = attributes_for(:operator, name: nil, email: nil)

        post "/operators", params: { operator: operator_attributes }
binding.pry
        expect(response).to have_http_status(:unprocessable_entity)
        expect(json_body).to include(:errors)
      end
    end
  end
end
