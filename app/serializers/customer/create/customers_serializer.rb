class Customer::Create::CustomersSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :age
end
