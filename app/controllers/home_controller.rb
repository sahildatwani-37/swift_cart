class HomeController < ApplicationController
  def index
    @categories = Category.take(8)
  end
end
