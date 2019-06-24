class RelationshipsController < ApplicationController
  before_action:authenticate_user!

  def create
    user = User.find(params[:followed_id])
    current_user.follow(user)
    flash[:notice] = t('flash.follow.notice')
    redirect_to user
  end

  def destroy
    user = Relationship.find(params[:id]).followed
    current_user.unfollow(user)
    flash[:notice] = t('flash.unfollow.notice')
    redirect_to user
  end
end
