class Admin::OrdersController < AdminController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  def index
    @orders = Order.all.order(created_at: :desc)
  end

  def show
  end

  def new
    @order = Order.new
  end

  def edit
  end

  def create
    @order = Order.new(order_params)
    @order.order_date = Time.current


    if @order.save
      redirect_to admin_order_path(@order), notice: 'Order was successfully created.'
    else
      render :new
    end
  end

  def update
    if @order.update(order_params)
      redirect_to admin_order_path(@order), notice: 'Order was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @order.destroy
    redirect_to admin_orders_url, notice: 'Order was successfully destroyed.'
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:customer_email, :total_price, :status, :shipping_address, :payment_method, product_ids: [])
  end
end
