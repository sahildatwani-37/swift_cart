class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])

    response = Faraday.get('http://localhost:3000/api/products/search', {
      category_id: @category.id,
      min: params[:min],
      max: params[:max],
      colors: params[:colors],
      sizes: params[:sizes],
      query: params[:query]
    })

    @products = JSON.parse(response.body)
  end
end


