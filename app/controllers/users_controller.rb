class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user # если пользователей будет регестрировать админ, то удалить эту строку
      flash[:success] = "Пользователь успешно зарегестрирован"
      redirect_to @user
    else
      render 'new'
    end
  end

  private

    def user_params
      params.require(:user).permit(:login, :first_name, :second_name, :email,
                                   :password, :password_confirmation, :avatar)
    end
end
