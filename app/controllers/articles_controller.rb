class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end

  def create
    article = Article.new(article_params)
    article.member_id = current_user.id
    tag_list = params[:article][:tag_name].split(",")
    if article.save
       article.save_tag(tag_list)
       redirect_to article_path(article.id), notice:"投稿しました"
    else
       render :new
    end
  end

  def index
  end

  def show
  end


  private

  def article_params
    params.require(:article).permit(:title, :article_image, :text)
  end

end
