class CheatsheetsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :set_cheatsheet, only: [:show]
  before_action :set_current_user, only: [:edit, :update, :destroy]

  def index
    @cheatsheets = Cheatsheet.all
  end

  def show
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
    @cheatsheet = Cheatsheet.find(params[:id])
  end

  def set_current_user
    @cheatsheet = current_user.cheatsheets.find(params[:id])
  end

  def cheatsheet_params
    params.require(:cheatsheet).permit(:title, :body)
  end
end
