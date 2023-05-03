class Api::V1::TransactionsController < ApplicationController
  before_action :set_transaction, only: [:show, :update, :delete]

  def index
    @transactions = Transaction.all

    return render :json => @transactions, status: 200
  end

  def show
    return render :json => @transaction.customers, status: 200
  end

  def create
    transaction = Transaction.new(transaction_params)

    if transaction.save
      return render :json => transaction, status: 200
    else
      return render :json => transaction.errors, status: 400
    end

  end

  def update
    if @transaction.update(transaction_params)
      return render :json => @transaction, status: 200
    else
      return render :json => @transaction.errors, status: 400
    end
  end

  def delete
    if @transaction.destroy
      return render :json => 'Data Berhasil Dihapus', status: 200
    else
      return render :json => 'Data Gagal Dihapus'
    end
  end

  private

  def set_transaction
    @transaction = Transaction.find(params[:id])
  end

  def transaction_params
    params.require(:transactions).permit(:qty,:customer_id, :product_id, :payment_method_id)
  end
end
