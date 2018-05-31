class FollowshipsController < ApplicationController

  def create
    @user = User.find(params[:format])
      @user.followships.new(user_id: current_user.id, following_id: @user)
    if @user.save
        redirect_back(fallback_location: root_path) 
        flash[:notice] = "Follow was successful created"
    else
      redirect_back(fallback_location: root_path) 
      flash[:alert] = @user.errors.full_messages.to_sentence
    end  
  end


end
