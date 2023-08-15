class BuddiesController < ApplicationController
  def index
    @buddys = Buddy.all
  end

  def new
    @buddy = Buddy.new
  end

  def show
    @buddy = Buddy.find(params[:id])
    @user = current_user
  end

  def create
    @buddy = Buddy.new(buddy_params)
    if @buddy.save
      redirect_to buddys_path
    else
      render 'new'
    end
  end

  def update
    @buddy = current_user.buddys.find(params[:id])

    if @buddy.update(buddy_params)
      redirect_to buddys_path, notice: 'Buddy was updated.'
    else
      render :edit
    end
  end

  def destroy
    @buddy = Buddy.find(params[:id])
    @buddy.destroy
    redirect_to buddys_path
  end

  def feed
    @buddy = current_user.buddy
    points_to_feed = params[:points].to_i
    puts current_user.points.class
    puts points_to_feed.class

    if current_user.points >= points_to_feed
      current_user.update(points: current_user.points - points_to_feed)
      @buddy.update(love: @buddy.love + points_to_feed)
      flash[:notice] = "#{points_to_feed} points fed to your buddy!"
    else
      flash[:alert] = "You don't have enough points."
    end
    redirect_to buddy_path(@buddy)
  end

  private

  def buddy_params
    params.require(:buddy).permit(:name, :personality)
  end
end
