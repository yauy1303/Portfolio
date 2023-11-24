class HomesController < ApplicationController
  def top
    # いいねのランキング順に並び替える
    @article_like_ranks = Article.find(Favorite.group(:article_id).order('count(article_id) desc').limit(3).pluck(:article_id))
    @new_article = Article.order(id: :DESC).limit(3)
    @tag_list = Tag.order(:id).page(params[:page]).per(30)
  end

  def about
  end

end
