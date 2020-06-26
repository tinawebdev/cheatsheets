class PagesController < ApplicationController
  def home
    @tags = Tag.sorted
  end
end
