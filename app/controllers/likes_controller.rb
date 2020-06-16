class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @cheatsheet = Cheatsheet.friendly.find(params[:cheatsheet_id])
    @cheatsheet.likes.create!(user: current_user)
    redirect_to @cheatsheet
  end

  def destroy
    like = current_user.likes.find(params[:id])
    like.destroy

    cheatsheet = Cheatsheet.friendly.find(params[:cheatsheet_id])
    redirect_to cheatsheet
  end
end
