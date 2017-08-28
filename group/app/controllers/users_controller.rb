class UsersController < ApplicationController
  def create
    @user = User.create(user_param)

    if  @user.save
        session[:user_id] = @user.id

        return redirect_to "/groups"
    end

    flash[:errors] = @user.errors.full_messages

    return redirect_to :back

  end

  private
    def user_param
      params.require(:user).permit(:first_name, :last_name, :email, :password)
    end
end
