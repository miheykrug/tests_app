class UsersController < ApplicationController
  before_action :signed_in_user, only: [:index, :edit, :update, :destroy]
  before_action :currect_user, only: [:edit, :update]
  before_action :admin_user, only: [:new, :create, :destroy]

  def index
    @users = User.paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
  end
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # sign_in @user # если пользователей будет регестрировать админ, то удалить эту строку
      flash[:success] = "Пользователь успешно зарегестрирован"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "Профиль обновлен"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "Пользователь удален."
    redirect_to users_url
  end

  private

    def user_params
      params.require(:user).permit(:login, :first_name, :second_name, :email,
                                   :password, :password_confirmation, :avatar)
    end

    def signed_in_user
      store_location
      redirect_to signin_url, notice: "Пожалуйста, авторизуйтесь." unless signed_in?      
    end

    def currect_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
