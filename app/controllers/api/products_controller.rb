class Api::ProductsController < ApplicationController
  def search
    search_service = ProductSearchService.new(
      category: params[:category_id].present? ? Category.find(params[:category_id]) : nil,
      min_price: params[:min],
      max_price: params[:max],
      colors: params[:colors].present? ? params[:colors].split(',') : [],
      sizes: params[:sizes].present? ? params[:sizes].split(',') : [],
      query: params[:query]
    )

    @products = search_service.search
    render json: @products, each_serializer: ProductSerializer
  end
end
