class TransactionsController < ApplicationController
  def create
    Payjp.api_key = Rails.application.credentials.payjp[:secret_key]
    charge = Payjp::Charge.create(
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
