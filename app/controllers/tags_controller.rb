class TagsController < ApplicationController
  def show
    @tag = Tag.friendly.find(params[:id])
    @cheatsheets = @tag.cheatsheets.public_cheatsheets
  end
end
