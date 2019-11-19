class TransactionsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  before_action :get_item, only: [:new, :create]

  def new
  end

  def create
    Payjp.api_key = Rails.application.credentials.payjp[:secret_key]
    charge = Payjp::Charge.create(
      amount: @item.price,
      customer: Card.find_by(user_id: current_user.id).customer_id,
      currency: 'jpy'
    )
    Transaction.create(create_params)
    @item.process = "selltradeing"
    @item.save
    render 'result' if charge.captured
  end

  def result
  end

  def failure
  end

  def get_item
    @item = Item.find(params[:item_id])
  end

  private
  def create_params
    params.permit(:price, :payment_style, :status, :item_id)
  end
end
