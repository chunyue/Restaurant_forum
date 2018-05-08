class UsersController < ApplicationController
  def show

    @user = User.find(params[:id])
  end

  def update
      @user = User.find(params[:id])
      if @user == current_user
        @user.update(user_params)
        flash[:notice] = "User fata was successfully updated"
        redirect_to user_path(current_user)
      else
        flash[:alert] = "Wrong"  
        redirect_to user_path(current_user)
      end
  end

  def edit
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:avatar, :name, :intro)
  end

end
