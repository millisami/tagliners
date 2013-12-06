class AchievementsController < ApplicationController

  respond_to :json

  def index
    respond_with Achievement.all
  end
end