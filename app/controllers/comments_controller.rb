class CommentsController < ApplicationController

  def create
    article = Article.find(params[:article_id])
    comment = current_member.comments.new(comment_params)
    comment.article_id = article.id
    if comment.save
      redirect_to request.referer, notice: "コメントしました"
    else
      redirect_to request.referer, alert:"メッセージを入力してください"
    end
  end

  def destroy
    Comment.find(params[:id]).destroy
    redirect_to request.referer, notice: "コメントを削除しました"
  end

  private

  def comment_params
    params.require(:comment).permit(:article_comment)
  end

end
