class Category < ApplicationRecord

  has_many :subcategories, class_name: "Category", foreign_key: "parent_id", dependent: :destroy
  belongs_to :parent_category, class_name: "Category", optional: true, foreign_key: "parent_id"
  has_many :products, dependent: :destroy

  has_one_attached :image do |attachable|
    attachable.variant :thumb, resize_to_limit: [50, 50]
  end
end