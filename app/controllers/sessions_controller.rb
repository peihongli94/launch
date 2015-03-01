class SessionsController < ApplicationController
  skip_before_filter :verify_logged_in

  def create
    facebook = User.koala(request.env['omniauth.auth']['credentials'])
    facebook_user = facebook.get_object("me")
    @user = User.find_by(email: facebook_user["email"])
    if @user.nil?
      options = { account: { name: facebook_user["email"] } }
      response = coinbase.post('/accounts', options)
      @user = User.create(email: facebook_user["email"], first_name: facebook_user["first_name"], last_name: facebook_user["last_name"], account_id: response["account"]["id"])
    end
    session[:user_id] = @user.id

    #transer some funds
    coinbase.send_money @user.account_id, 0.001, "This is a gift to help you get started.", account_id: '54f371c24463dfefac00014a'
    redirect_to get_started_path
  end
end
