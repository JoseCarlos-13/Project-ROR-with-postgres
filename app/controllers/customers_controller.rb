class CustomersController < ApplicationController
  before_action :customer, only: [:show, :update, :destroy]
  before_action :authenticate_customer!, except: %i[index, show]

  def index
    @customers = Customer.all

    render json: @customers,
           each_serializer: Customer::Index::CustomersSerializer,
           status: :ok
  end

  def create
    @new_customer = Customer.new(customer_params)

    if @new_customer.save
      render json: @new_customer,
             serializer: Customer::Create::CustomersSerializer,
             status: :created
    else
      render json: { errors: @new_customer.errors },
             status: :unprocessable_entity
    end
  end

  def show
    render json: @customer,
           serializer: Customer::Show::CustomersSerializer,
           status: :ok
  end

  def update
    @customer.update(customer_params)

    head :no_content
  end

  def destroy
    @customer.delete

    head :no_content
  end

  private

  def customer
    @customer = Customer.find(params[:id])
  end

  def customer_params
    params.require(:customer).permit(:name, :email, :age, :customer_image)
  end
end
