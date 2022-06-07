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
end
