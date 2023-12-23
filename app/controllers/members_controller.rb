class MembersController < ApplicationController
   before_action :authenticate_member!

  def index
    @members = Member.page(params[:page]).per(5)
  end

  def show
    @member = Member.find(params[:id])
    @articles = @member.articles.page(params[:page]).per(3)
  end

  def edit
    member = Member.find(params[:id])
    unless member.id == current_member.id
      redirect_to member_path(member.id)
    end

    @member = Member.find(params[:id])
  end

  def update
    member = Member.find(params[:id])

    unless member.id == current_member.id
      redirect_to member_path(member.id)
    end

    if member.update(member_params)
      redirect_to  member_path(member.id), notice: "プロフィールが更新されました"
    else
      redirect_to edit_member_path(member.id), alert: "メンバーネームを１文字以上、自己紹介を１６０字以内で入力してください"
    end
  end

  def quit
  end

  def out
    member = Member.find(params[:id])
    member.update(is_member: !member.is_member)
    if member.is_member
      flash[:notice] =  "管理者により退会になりました"
    else
      flash[:notice] = "有効にします"
    end
    redirect_to request.referer
  end

  # ストロングパラメータ
  private

  def member_params
    params.require(:member).permit(:name, :introduction, :profile_image)
  end


end
