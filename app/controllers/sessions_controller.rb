class SessionsController < ApplicationController
  def new
    
  end

  def create
    user = User.find_by(login: params[:login].downcase)
    if user && user.authenticate(params[:password])
      sign_in user
      redirect_to user
    else
      flash.now[:error] = 'Неверный логин или пароль'
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end
end
