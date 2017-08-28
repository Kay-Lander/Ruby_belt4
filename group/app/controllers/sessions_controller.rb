class SessionsController < ApplicationController
  def create
    @user = User.find_by_email(params[:user][:email])

    if @user
        if @user.try(:authenticate, params[:user][:password])
            session[:user_id] = @user.id

            return redirect_to '/groups'
        end

        flash[:errors] = ["You stalll not pass!!"]

    end

    flash[:errors] = ["Email account wrong"]

    return redirect_to :back
  end

  def delete
    session.clear
    return redirect_to root_path
  end
end
