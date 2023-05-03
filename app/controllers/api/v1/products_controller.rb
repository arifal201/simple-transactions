class Api::V1::ProductsController < ApplicationController
  before_action :set_product, only: [:show, :delete, :update]

  def index
    @product = Product.all

    return render :json => @product.to_json
  end

  def show
    return render :json => @product
  end

  def delete
    if @product.destroy
      return render :json => 'Data Berhasil Dihapus'
    else
      return render :json => 'Data Gagal Dihapus'
    end
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      return render :json => @product
    else
      return render :json => 'Gagal Membuat Data'
    end
  end

  def update
    if @product.update(product_params)
      return render :json => @product
    else
      return render :json => 'Gagal Update Data'
    end
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name)
  end
end
