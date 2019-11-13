class TransactionsController < ApplicationController
  def pay
    Payjp.api_key = 'sk_test_ce086d5f238dc955b364d76b'
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
