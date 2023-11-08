class RelationshipsController < ApplicationController
  before_action :authenticate_member!

  def create
    member = Member.find(params[:member_id])
    current_member.follow(member)
    redirect_to request.referer
  end

  def destroy
    member = Member.find(params[:member_id])
    current_member.unfollow(member)
    redirect_to request.referer
  end

  def following
    member = Member.find(params[:member_id])
    @member = member.followings
  end

  def followed
    member = Member.find(params[:member_id])
    @member = member.followeds
  end

end
