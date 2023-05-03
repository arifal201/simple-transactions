class Api::V1::PaymentMethodsController < ApplicationController
  before_action :set_payment_method, only: [:show, :update, :delete]

  def index
    @payment_methods = PaymentMethod.all

    return render :json => @payment_methods.to_json
  end

  def show
    return render :json => @payment_method
  end

  def delete
    if @payment_method.destroy
      return render :json => 'Data Berhasil Dihapus'
    else
      return render :json => 'Data Gagal Dihapus'
    end
  end

  def create
    @payment_method = PaymentMethod.new(payment_method_params)

    if @payment_method.save
      return render :json => @payment_method
    else
      return render :json => 'Gagal Membuat Data'
    end
  end

  def update
    if @payment_method.update(payment_method_params)
      return render :json => @payment_method
    else
      return render :json => 'Gagal Update Data'
    end
  end

  private

  def set_payment_method
    @payment_method = PaymentMethod.find(params[:id])
  end

  def payment_method_params
    params.require(:payment_method).permit(:name)
  end
end
