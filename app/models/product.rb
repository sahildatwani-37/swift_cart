class Product < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  belongs_to :category
  has_many :order_products, dependent: :destroy
  has_many :orders, through: :order_products

  has_many_attached :images do |attachable|
    attachable.variant :thumb, resize_to_limit: [60, 60]
    attachable.variant :medium, resize_to_limit: [300, 300]
  end
  settings do
    mappings dynamic: 'false' do
      indexes :title, type: :text, analyzer: 'english'
      indexes :description, type: :text, analyzer: 'english'
      indexes :price, type: :float
      indexes :colors, type: :keyword
      indexes :sizes, type: :keyword
      indexes :category_id, type: :integer
    end
  end
end

