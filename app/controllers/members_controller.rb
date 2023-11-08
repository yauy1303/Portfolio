class MembersController < ApplicationController
   before_action :authenticate_member!
  
  def index
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

  # ストロングパラメータ
  private

  def member_params
    params.require(:member).permit(:name, :introduction, :profile_image)
  end


end
