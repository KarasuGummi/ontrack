class BuddiesController < ApplicationController
  def index
    @buddys = Buddy.all
  end

  def new
    @buddy = Buddy.new
  end

  def show
    @buddy = Buddy.find(params[:id])
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

  private

  def buddy_params
    params.require(:buddy).permit(:name, :personality)
  end
end
