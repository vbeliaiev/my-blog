class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      login(user_params[:email], user_params[:password])
      redirect_to root_url, notice: 'Signed up and logged in!'
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id]).decorate
  end

  private

  def user_params
    params.require(:user).permit(:email,
                                 :password,
                                 :password_confirmation,
                                 :first_name,
                                 :last_name)
  end
end
