class Customer::Show::CustomersSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :age, :customer_image

  def customer_image
    object.image_url
  end
end
