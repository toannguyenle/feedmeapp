class PaymentsController < ApplicationController
  def index
    payments = Payment.all
    render json: payments, status: 200
  end

  def new
    payment = Payment.new
    # render json: restaurant, status: 201
  end
  
  def create
    payment = Payment.create(payment_params)
    render json: restaurant, status: 201
  end

  def update
    payment = Payment.find(params[:id])
    payment.update_attributes(payment_params)
    render nothing: true, status: 204
  end

  def destroy
    payment = Payment.find(params[:id])
    payment.destroy
    render nothing: true, status: 204
  end

  private

  def payment_params
    params.require(:payment).permit(:payment_method, :amount, :status, :order_id)
  end
end