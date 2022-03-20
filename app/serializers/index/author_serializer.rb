class Index::AuthorSerializer < ActiveModel::Serializer
  attributes :id, :name, :author_image

  def author_image
    object.image_url
  end
end
