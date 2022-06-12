class Customer::Show::CustomersSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :age
end
