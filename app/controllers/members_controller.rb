class MembersController < ApplicationController
   before_action :authenticate_member!

  def index
    @members = Member.page(params[:page])
  end

  def show
    @member = Member.find(params[:id])
  end

  def edit
    @member = Member.find(params[:id])
  end

  def update
    member = Member.find(params[:id])
    member.update(member_params)
    redirect_to  member_path(member.id), notice: "プロフィールが更新されました"
  end

  def quit
  end

  def out
    member = Member.find(params[:id])
    member.update(is_member: !member.is_member)
    if member.is_member
      flash[:alert] =  "管理者により退会になりました"
    else
      flash[:notice] = "有効にします"
    end

    redirect_to request.referer, notice: "管理者により退会になりました"
  end

  # ストロングパラメータ
  private

  def member_params
    params.require(:member).permit(:name, :introduction, :profile_image)
  end


end
