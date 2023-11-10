class HomesController < ApplicationController
  def top
    @tags = Tag.all
  end

  def about
  end
end
