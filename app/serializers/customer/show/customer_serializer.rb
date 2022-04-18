class Customer::Show::CustomerSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :age
end
