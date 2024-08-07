class Admin::ProductsController < AdminController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all
  end

  def show
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to admin_product_path(@product), notice: 'Product was successfully created.'
    else
      render :new
    end
  end

  def update
    if @product.update(product_params.reject { |k| k["images"] })
      if product_params["images"]
        product_params["images"].each do |image|
          @product.images.attach(image)
        end
      end
      redirect_to admin_products_path, notice: "Product updated successfully"
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to admin_products_path, notice: 'Product was successfully destroyed.'
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    permitted_params = params.require(:product).permit(:title, :description, :price, :category_id, images: [], colors: [], sizes: [])
    permitted_params[:colors] = params[:product][:colors].split(',') if params[:product][:colors].present?
    permitted_params[:sizes] = params[:product][:sizes].split(',') if params[:product][:sizes].present?
    permitted_params
  end
end