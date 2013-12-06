class AchievementsController < ApplicationController

  respond_to :json

  def index
    respond_with Achievement.all
  end

  def create
    respond_with Achievement.create achievement_params
  end

private
  def achievement_params
    params.require(:achievement).permit(:title, :achieved_at)
  end
end