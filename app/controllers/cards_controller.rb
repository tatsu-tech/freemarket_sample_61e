class CardsController < ApplicationController
  require "payjp"

  def new
    card = Card.where(user_id: current_user.id)
    redirect_to done_signup_index_path  if card.exists?
  end

  def pay
    Payjp.api_key = 'sk_test_f16297a659e2865c9803e3b8'
    if params['payjp_token'].blank?
      binding.pry
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(
      description: '登録テスト',
      email: current_user.email, 
      card: params['payjp_token'],
      metadata: {user_id: current_user.id}
      )
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to done_signup_index_path
      else
        redirect_to action: "pay"
      end
    end
  end

  def delete
    card = Card.where(user_id: current_user.id).first
    if card.blank?
    else
      Payjp.api_key = 'sk_test_f16297a659e2865c9803e3b8'
      customer = Payjp::Customer.retrieve(card.customer_id)
      custpmer.delete
      card.delete
    end
      redirect_to action: "new"
  end

  def show
    card = Card.where(user_id: current_user.id).first
    if card.blank?
      redirect_to action: "new"
    else
      Payjp.api_key = 'sk_test_f16297a659e2865c9803e3b8'
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.card.retrieve(card.card_id)
    end
  end

end
