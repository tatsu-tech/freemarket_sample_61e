class TransactionsController < ApplicationController
  def create
    Payjp.api_key = Rails.application.credentials.payjp[:secret_key]
    charge = Payjp::Charge.create(
# 以下は、追って購入確認画面から引いてくる形で実装する予定。その段階では、当然顧客IDはここには記載されない。
      amount: 1000,
      customer: 'cus_12f7c6314638b6a5a02f779c71ed',
      currency: 'jpy'
    ) 
    render 'result' if charge.captured
  end

  def result
  end

  def failure
  end
end
