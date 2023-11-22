class RelationshipsController < ApplicationController
  before_action :authenticate_member!

  def create
    @member = Member.find(params[:member_id])
    current_member.follow(@member)
    # 非同期対応
    # redirect_to request.referer
  end

  def destroy
    @member = Member.find(params[:member_id])
    current_member.unfollow(@member)
    # 非同期対応
    # redirect_to request.referer
  end

  def followings
    member = Member.find(params[:member_id])
    @member = member.followings
    @view_name = Member.find(params[:member_id])
  end

  def followeds
    member = Member.find(params[:member_id])
    @member = member.followeds
    @view_name = Member.find(params[:member_id])
  end

end
