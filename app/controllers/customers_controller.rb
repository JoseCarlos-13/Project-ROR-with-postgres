class CustomersController < ApplicationController
  before_action :customer, only: [:show, :update]

  def index
    @customers = Customer.all

    render json: @customers,
           each_serializer: Customer::Index::CustomerSerializer,
           status: :ok
  end

  def create
    @new_customer = Customer.new(customer_params)

    if @new_customer.save
      render json: @new_customer,
             serializer: Customer::Create::CustomerSerializer,
             status: :created
    else
      render json: { errors: @new_customer.errors },
             status: :unprocessable_entity
    end
  end

  def show
    render json: @customer,
           serializer: Customer::Show::CustomerSerializer,
           status: :ok
  end

  def update
    @customer.update(customer_params)

    head :no_content
  end

  private

  def customer
    @customer = Customer.find(params[:id])
  end

  def customer_params
    params.require(:customer).permit(:name, :email, :age)
  end
end
