class FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_cheatsheet, only: [:create, :destroy]

  def index
    unless current_user.favorited_cheatsheets.any?
      redirect_to cheatsheets_url, notice: "No favorites"
    end
  end

  def create
    if Favorite.create(cheatsheet: @cheatsheet, user: current_user)
      flash[:notice] = "You favorited #{@cheatsheet.title}"
      redirect_back(fallback_location: cheatsheets_url)
    else
      flash[:notice] = "Something went wrong..."
      redirect_back(fallback_location: cheatsheets_url)
    end
  end

  def destroy
    Favorite.where(cheatsheet_id: @cheatsheet.id, user_id: current_user.id).first.destroy
    flash[:notice] = "Unfavorited #{@cheatsheet.title}"
    redirect_back(fallback_location: cheatsheets_url)
  end

  private

  def set_cheatsheet
    @cheatsheet = Cheatsheet.friendly.find(params[:id] || params[:cheatsheet_id])
  end
end
