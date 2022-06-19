class OperatorsController < ApplicationController
  def index
    @operators = Operator.all

    render json: @operators,
           each_serializer: Operator::Index::OperatorsSerializer,
           status: :ok
  end

  def show
    @operator = Operator.find(params[:id])

    render json: @operator,
           serializer: Operator::Show::OperatorsSerializer,
           status: :ok
  end

  def create
    @operator = Operator.new(operator_attributes)

    if @operator.save
      render json: @operator,
             serializer: Operator::Create::OperatorsSerializer,
             status: :created
    else
      render json: { errors: @operator.errors.messages },
             status: :unprocessable_entity
    end
  end

  private

  def operator_attributes
    params.require(:operator).permit(:name, :email)
  end
end
