class UserInterestsController < ApplicationController
  def index
    @interests = Interest.all
  end
end
