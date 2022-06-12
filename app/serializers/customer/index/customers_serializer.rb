class Customer::Index::CustomersSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :age
end
