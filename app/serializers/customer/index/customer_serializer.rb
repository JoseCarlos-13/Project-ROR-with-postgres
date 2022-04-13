class Customer::Index::CustomerSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :age
end
