class HomesController < ApplicationController
  def top
    @article_like_ranks = Article.find(Favorite.group(:article_id).order('count(article_id) desc').limit(3).pluck(:article_id))
    @new_article = Article.order('id DESC').limit(3)
  end

  def about
  end
end
