class CustomersController < ApplicationController
  before_action :set_customer, only: [:show]

  def index
    @customers = Customer.all

    render json: @customers,
           each_serializer: Customer::Index::CustomerSerializer,
           status: :ok
  end

  def show
    render json: set_customer,
           serializer: Customer::Show::CustomerSerializer,
           status: :ok
  end

  private

  def set_customer
    @customer = Customer.find(params[:id])
  end
end
