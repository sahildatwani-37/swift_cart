class AdminController < ApplicationController
  layout 'admin'
  before_action :authenticate_admin!

  def index
    @total_revenue = Order.sum(:total_price)
    @total_orders = Order.count
    @total_pending_orders = Order.where(status: 'pending').count
    @top_selling_products = Product
      .joins(:order_products)
      .select('products.*, COUNT(order_products.id) AS sales_count')
      .group('products.id')
      .order('sales_count DESC')
      .limit(5)

    @recent_orders = Order.order(created_at: :desc).limit(5)
  end
end