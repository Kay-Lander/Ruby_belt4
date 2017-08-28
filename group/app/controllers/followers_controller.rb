class FollowersController < ApplicationController
  def create
    @org = Org.find(params[:id])
    Follower.create(user: current_user, org: @org)
    return redirect_to :back
  end

  def delete
    @org = Org.find(params[:id])
    Follower.find_by(org: @org, user: current_user).delete
    return redirect_to :back
  end
end
