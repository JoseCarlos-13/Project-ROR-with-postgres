require 'rails_helper'
require 'support/request_helper_spec'

RSpec.describe "Operators", type: :request do
  describe "GET #index" do
    context "when return a operators list" do
      it "must return the list" do
        operators = create_list(:operator, 2)

        get "/operators"

        expect(response).to have_http_status(:ok)
        expect(json_body[0]).to include(:name, :email)
      end
    end
  end

  describe "GET #show" do
    context "when return a operators list" do
      it "must return the list" do
        operator = create(:operator)

        get "/operators/#{operator.id}"

        expect(response).to have_http_status(:ok)
        expect(json_body).to include(:name, :email)
      end
    end
  end
end
