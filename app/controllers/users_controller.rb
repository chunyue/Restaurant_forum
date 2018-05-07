class UsersController < ApplicationController
  def show

    @user = User.find(params[:id])
  end

  def update
    if current_user == @user
      @user.update(user_params)
      flash[:notice] = "User fata was successfully updated"
      redirect_to user_path(current_user)
    end  
  end

  private

  def user_params
    params.require(:user).permit(:avatar, :name, :intro)
  end

end
