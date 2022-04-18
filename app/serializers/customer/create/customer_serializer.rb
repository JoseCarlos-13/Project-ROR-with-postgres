class Customer::Create::CustomerSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :age
end
