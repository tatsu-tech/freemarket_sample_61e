class TransactionsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def new
    @item = Item.find(params[:item_id])
    # @transaction = Transaction.new
  end

  def create
    @item = Item.find(params[:item_id])
    Payjp.api_key = Rails.application.credentials.payjp[:secret_key]
    charge = Payjp::Charge.create(
# 以下は、追って購入確認画面から引いてくる形で実装する予定。その段階では、当然顧客IDはここには記載されない。
      amount: @item.price,
      customer: Card.find_by(user_id: current_user.id).customer_id,
      currency: 'jpy'
    )
    Transaction.create(create_params)
    item = @item
    item.process = "selltradeing"
    item.save
    render 'result' if charge.captured
  end

  def result
  end

  def failure
  end

  private
  def create_params
    params.permit(:price, :payment_style, :status, :item_id)
  end
end
