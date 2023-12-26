class CommentsController < ApplicationController

  def create
    @article = Article.find(params[:article_id])
    @comment = current_member.comments.new(comment_params)
    @comment.article_id = @article.id
    
    respond_to do |format|
      if @comment.save
        format.js { render :create }
      else
        format.js { render :error }
      end
    end
  end

  def destroy
    Comment.find(params[:id]).destroy
    @article = Article.find(params[:article_id])
    # 非同期通信対応
    redirect_to request.referer, notice: "コメントを削除しました"
  end

  private

  def comment_params
    params.require(:comment).permit(:article_comment)
  end

end
