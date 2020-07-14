class CheatsheetsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :set_cheatsheet, only: [:show]
  before_action :set_current_user, only: [:edit, :update, :destroy]
  before_action :private_cheatsheet_guard!, only: [:show]

  def index
    @cheatsheets = Cheatsheet.public_cheatsheets
    @q = Cheatsheet.public_cheatsheets.ransack(params[:q])
    @cheatsheet_results = @q.result
  end

  def show
    if current_user
      @like = current_user.likes.find_by(cheatsheet_id: @cheatsheet.id)
    end
  end

  def new
    @cheatsheet = current_user.cheatsheets.build
  end
  
  def edit
  end

  def create
    @cheatsheet = current_user.cheatsheets.build(cheatsheet_params)
  
    if @cheatsheet.save
      redirect_to @cheatsheet, notice: "Cheatsheet successfully created!"
    else
      render :new
    end
  end

  def update
    if @cheatsheet.update(cheatsheet_params)
      redirect_to @cheatsheet, notice: "Cheatsheet successfully updated!"
    else
      render :edit
    end
  end

  def destroy
    @cheatsheet.destroy
    redirect_to cheatsheets_url, notice: "Cheatsheet successfully deleted!"
  end

  private

  def set_cheatsheet
    @cheatsheet = Cheatsheet.friendly.find(params[:id])
  end

  def set_current_user
    if current_user.admin?
      @cheatsheet = Cheatsheet.friendly.find(params[:id])
    else
      begin
        @cheatsheet = current_user.cheatsheets.friendly.find(params[:id])
      rescue
        redirect_to cheatsheets_url, notice: "Access denied!"
      end
    end
  end

  def private_cheatsheet_guard!
    if @cheatsheet.private?
      unless (signed_in? && current_user == @cheatsheet.user)
        redirect_to cheatsheets_url, notice: "Access denied!"
      end
    end
  end

  def cheatsheet_params
    params.require(:cheatsheet).permit(:title, :hashtags, :body, :public)
  end
end
