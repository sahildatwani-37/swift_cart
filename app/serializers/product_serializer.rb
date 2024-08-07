class ProductSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :price, :colors, :sizes, :category_id, :created_at, :updated_at

  has_many :images

  def images
    object.images.map do |image|
      Rails.application.routes.url_helpers.rails_blob_url(image, only_path: true)
    end
  end
end
