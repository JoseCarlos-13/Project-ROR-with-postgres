class CustomersController < ApplicationController
  def index
    @customers = Customer.all

    render json: @customers,
           each_serializer: Customer::Index::CustomerSerializer,
           status: :ok
  end
end
