class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def edit
    @user = current_user
    @interests = Interest.all
  end

  def update
    @user = current_user
    if @user.update(user_params)
      @user.interests = Interest.where(id: params[:user][:interest_ids])
      redirect_to edit_profile_path, notice: 'Profile successfully updated!'
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:age, :grade, :subject, :learning_goal)
  end
end
