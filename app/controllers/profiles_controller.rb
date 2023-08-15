class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @buddy = current_user.buddy
    @profile_greetings = [
      "Hi there!", "What's up?", "What are you interested in?", "Want to add new interest?",
      "Want to update your profile?", "I know you can do it!",
      "What subject do you want to learn?"
    ]
  end

  def edit
    @user = current_user
    @buddy = current_user.buddy
    @interests = Interest.all
  end

  def update
    @user = current_user
    if @user.update(user_params)
      @user.interests = Interest.where(id: params[:user][:interest_ids])
      redirect_to profiles_path, notice: 'Profile successfully updated!'
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:age, :grade, :subject, :learning_goal)
  end
end
