class ArticlesController < ApplicationController

  def search
    @q = Article.ransack(params[:q])
    @articles = @q.result(distinct: true)
    @result = params[:q]&.values&.reject(&:blank?)
    @search_word = @q.title_cont
  end

  def index
    @articles = Article.page(params[:page])
  end

  def show
    @article = Article.find(params[:id])
    @member = Member.find(@article.member_id)
    @tag = @article.tags
    @comment = Comment.new
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.member_id = current_member.id
    tag_list = params[:article][:tag_name].split(",")
    if @article.save!
       @article.save_tag(tag_list)
       redirect_to article_path(@article.id), notice:"投稿しました"
    else
       render :new
    end
  end

  def edit
    @article = Article.find(params[:id])
    @tag_list = @article.tags.pluck(:tag_name).join(",")
  end

  def update
    @article = Article.find(params[:id])
    tag_list = params[:article][:tag_name].split(",")
    if @article.update(article_params)
       @article.save_tag(tag_list)
       redirect_to article_path(@article.id), notice:"編集しました"
    else
       render :edit
    end
  end

  def destroy
    article = Article.find(params[:id])
    article.destroy
    redirect_to articles_path, notice:"削除しました"
  end


  private

  def article_params
    params.require(:article).permit(:title, :article_image, :text)
  end

end
