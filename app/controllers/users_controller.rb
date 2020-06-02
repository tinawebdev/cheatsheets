class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :set_current_user, except: [:show]

  def show
    @user = User.find(params[:id])
    @public_cheatsheets = @user.cheatsheets.public_cheatsheets
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: "Account successfully updated!"
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to root_url, notice: "Account successfully deleted!"
  end

  private

  def set_current_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:username, :name, :bio, :location, :email)
  end
end
