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
    @treat = flash[:treat] || nil
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
    # points_to_feed = params[:points].to_i
    treats = { donut: 1, pizza: 2, book: 3, baseball: 4 }
    treat = params[:treat] || nil
    treat_points = treats[treat.to_sym]
    # puts current_user.points.class
    # puts points_to_feed.class

    if current_user.points >= treat_points
      current_user.update(points: current_user.points - treat_points)
      @buddy.update(love: @buddy.love + treat_points)
      flash[:notice] = "#{treat_points} points fed to your buddy!"
      case treat
      when 'pizza'
        flash[:treat] = 'pizza'
      when 'donut'
        flash[:treat] = 'donut'
      when 'book'
        flash[:treat] = 'book'
      when 'baseball'
        flash[:treat] = 'baseball'
      else
        flash[:alert] = "You don't have enough points."
      end
      redirect_to buddy_path(@buddy)
    end
  end

  private

  def buddy_params
    params.require(:buddy).permit(:name, :personality)
  end
end
