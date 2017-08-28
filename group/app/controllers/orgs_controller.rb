class OrgsController < ApplicationController
  def index
    @user = current_user
    @org = Org.all
  end

  def create
      org = Org.new(org_params)

      if org.save
        session[:org_id] = org.id
        Follower.create(user: current_user, org: @org)
        return redirect_to :back
      else
        flash[:errors] = org.errors.full_messages
        return redirect_to :back
      end
  end

  def show
    @org = Org.find(params[:id])
  end


  def delete
    @org = Org.find(params[:id])
    @follow = Follower.find_by(org: @org)

    @org.delete
    return redirect_to :back
  end

  private
    def org_params
      params.require(:org).permit(:name, :description).merge(user: current_user)
    end
end
