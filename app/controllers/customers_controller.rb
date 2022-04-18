class CustomersController < ApplicationController
  before_action :customer, only: [:show]

  def index
    @customers = Customer.all

    render json: @customers,
           each_serializer: Customer::Index::CustomerSerializer,
           status: :ok
  end

  def show
    render json: customer,
           serializer: Customer::Show::CustomerSerializer,
           status: :ok
  end

  private

  def customer
    @customer = Customer.find(params[:id])
  end
end
