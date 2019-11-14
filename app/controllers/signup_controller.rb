class SignupController < ApplicationController

  before_action :validates_signup1, only: :signup2 # step1のバリデーション
  before_action :validates_signup2, only: :signup3 # step2のバリデーション
  before_action :validates_signup3, only: :signup4 # step3のバリデーション

  def index
  end

  def signup1 
    @user = User.new
  end

  def signup2 
    session[:nickname] = user_params[:nickname]
    session[:email] = user_params[:email]
    session[:password] = user_params[:password]
    session[:password_confirmation] = user_params[:password_confirmation]
    session[:birthday] = birthday_match
    session[:name_family_kanji] = user_params[:name_family_kanji]
    session[:name_first_kanji] = user_params[:name_first_kanji]
    session[:name_family_kana] = user_params[:name_family_kana]
    session[:name_first_kana] = user_params[:name_first_kana]
    @user = User.new
    @user.user_address = UserAddress.new
  end

  def signup3 
    session[:mobile_phone_number] = user_params[:mobile_phone_number]
    @user = User.new
    @user.user_address = UserAddress.new
  end

  def signup4 
    gon.pk_key = ENV['PAYJP_TEST_PUBLIC_KEY']
    session[:send_name_family_kanji] = user_address_params[:send_name_family_kanji]
    session[:send_name_first_kanji] = user_address_params[:send_name_first_kanji]
    session[:send_name_family_kana] = user_address_params[:send_name_family_kana]
    session[:send_name_first_kana] = user_address_params[:send_name_first_kana]
    session[:zip] = user_address_params[:zip]
    session[:prefecture] = user_address_params[:prefecture]
    session[:city] = user_address_params[:city]
    session[:town] = user_address_params[:town]
    # session[:apartment] = user_address_params[:apartment]
    session[:phone_number] = user_address_params[:phone_number]
    @user.user_address = UserAddress.new

    @user = User.new(
      nickname: session[:nickname],
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation],
      birthday: session[:birthday],
      mobile_phone_number: session[:mobile_phone_number],
      name_family_kanji: session[:name_family_kanji],
      name_first_kanji: session[:name_first_kanji],
      name_family_kana: session[:name_family_kana],
      name_first_kana: session[:name_first_kana]
      )
      if @user.save
        sign_in User.find(@user.id) unless user_signed_in?
      else
        redirect_to signup_signup_index_path
      end
      # session[:id] = @user.id
      
      @user.user_address = UserAddress.new(
      send_name_family_kanji: session[:send_name_family_kanji],
      send_name_first_kanji: session[:send_name_first_kanji],
      send_name_family_kana: session[:send_name_family_kana],
      send_name_first_kana: session[:send_name_first_kana],
      zip: session[:zip],
      prefecture: session[:prefecture],
      city: session[:city],
      town: session[:town],
      # apartment: session[:apartment],
      phone_number: session[:phone_number]
      )
      
      @user.user_address.save
  end

  def validates_signup1
    session[:nickname] = user_params[:nickname]
    session[:email] = user_params[:email]
    session[:password] = user_params[:password]
    session[:password_confirmation] = user_params[:password_confirmation]
    session[:birthday] = birthday_match
    session[:name_family_kanji] = user_params[:name_family_kanji]
    session[:name_first_kanji] = user_params[:name_first_kanji]
    session[:name_family_kana] = user_params[:name_family_kana]
    session[:name_first_kana] = user_params[:name_first_kana]
    @user = User.new(
      nickname: session[:nickname],
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation],
      birthday: session[:birthday],
      mobile_phone_number: "01234567890",
      name_family_kanji: session[:name_family_kanji],
      name_first_kanji: session[:name_first_kanji],
      name_family_kana: session[:name_family_kana],
      name_first_kana: session[:name_first_kana]
      )
      render '/signup/signup1' unless @user.valid?
  end

  def validates_signup2
    
    session[:mobile_phone_number] = user_params[:mobile_phone_number]
    @user = User.new(
      nickname: session[:nickname],
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation],
      birthday: session[:birthday],
      mobile_phone_number: session[:mobile_phone_number],
      name_family_kanji: session[:name_family_kanji],
      name_first_kanji: session[:name_first_kanji],
      name_family_kana: session[:name_family_kana],
      name_first_kana: session[:name_first_kana]
      )
      render '/signup/signup2' unless @user.valid?
  end

  def validates_signup3
    
    session[:send_name_family_kanji] = user_address_params[:send_name_family_kanji]
    session[:send_name_first_kanji] = user_address_params[:send_name_first_kanji]
    session[:send_name_family_kana] = user_address_params[:send_name_family_kana]
    session[:send_name_first_kana] = user_address_params[:send_name_first_kana]
    session[:zip] = user_address_params[:zip]
    session[:prefecture] = user_address_params[:prefecture]
    session[:city] = user_address_params[:city]
    session[:town] = user_address_params[:town]
    # session[:apartment] = user_address_params[:apartment]
    session[:phone_number] = user_address_params[:phone_number]
    
    @user = User.new(
      nickname: session[:nickname],
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation],
      birthday: session[:birthday],
      mobile_phone_number: session[:mobile_phone_number],
      name_family_kanji: session[:name_family_kanji],
      name_first_kanji: session[:name_first_kanji],
      name_family_kana: session[:name_family_kana],
      name_first_kana: session[:name_first_kana]
      )
    @user.user_address = UserAddress.new(
      send_name_family_kanji: session[:send_name_family_kanji],
      send_name_first_kanji: session[:send_name_first_kanji],
      send_name_family_kana: session[:send_name_family_kana],
      send_name_first_kana: session[:send_name_first_kana],
      zip: session[:zip],
      prefecture: session[:prefecture],
      city: session[:city],
      town: session[:town],
      # apartment: session[:apartment],
      phone_number: session[:phone_number]
      )
      render '/signup/signup3' unless @user.user_address.valid?
  end

  private

  def user_params
    params.require(:user).permit(
      :nickname,
      :email,
      :password,
      :password_confirmation,
      :mobile_phone_number,
      :name_family_kanji,
      :name_first_kanji,
      :name_family_kana,
      :name_first_kana,
      :birthday
  )
  end

  def user_address_params
    params.require(:user_address).permit(
      :send_name_family_kanji,
      :send_name_first_kanji,
      :send_name_family_kana,
      :send_name_first_kana,
      :zip,
      :prefecture,
      :city,
      :town,
      # :apartment,
      :phone_number
    )
  end

  def birthday_match
    date = params[:birthday]

    # if date["birthday(1i)"].empty? && date["birthday(2i)"].empty? && date["birthday(3i)"].empty?
    #   return
    # end

    Date.new date["birthday(1i)"].to_i,date["birthday(2i)"].to_i,date["birthday(3i)"].to_i
  end

end