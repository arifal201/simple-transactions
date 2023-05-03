class Api::V1::CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :update, :delete]

  def index
    @customers = Customer.all

    return render :json => @customers.to_json
  end

  def show
    return render :json => @customer.to_json, status: 200
  end

  def create
    @customer = Customer.new(customer_params)

    if @customer.save
      return render :json => @customer.to_json
    else
      return render :json => 'Data Gagal Tersimpan'
    end
  end

  def update
    if @customer.update(customer_params)
      return render :json => @customer.to_json, status: 200
    else
      return render :json => 'Data Gagal Update'
    end
  end

  def delete
    @customer.destroy

    return render :json => 'Data Dihapus'
  end

  private

  def set_customer
    @customer = Customer.find(params[:id])
  end

  def customer_params
    params.require(:customer).permit(:name)
  end
end
