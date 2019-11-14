class CardsController < ApplicationController
  require "payjp"

  def new
    gon.pk_key = ENV['PAYJP_TEST_PUBLIC_KEY']
    card = Card.where(user_id: current_user.id)
  end

  def pay
    gon.pk_key = ENV['PAYJP_TEST_PUBLIC_KEY']
    Payjp.api_key = Rails.application.credentials.payjp[:secret_key]
    if params['payjp_token'].blank?
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
      Payjp.api_key = Rails.application.credentials.payjp[:secret_key]
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
      Payjp.api_key = Rails.application.credentials.payjp[:secret_key]
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.card.retrieve(card.card_id)
    end
  end

  def edit
  end
  
end
