class FavoritesController < ApplicationController

  def create
    @article = Article.find(params[:article_id])
    favorite = current_member.favorites.new(article_id: @article.id)
    favorite.save
    # 非同期対応
    # redirect_to request.referer
  end

  def destroy
    @article = Article.find(params[:article_id])
    favorite = current_member.favorites.find_by(article_id: @article.id)
    favorite.destroy
    # 非同期対応
    # redirect_to request.referer
  end

end
