class UsersController < ApplicationController
  respond_to :html, :json

  def show
    @user = current_user
  	if User.exists?(conditions: {nickname: params[:nickname]})
  		if params[:nickname] == current_user.nickname
  			render :layout => "profiles/current_user"
  		end
  	else
  		redirect_to root_path, :notice => "User does not exist"
  	end

  	unless params[:nickname]
  			render :layout => "profiles/user"
  	end
  end

  def update
    @user = current_user
    @user.update_attributes(params[:user])
    respond_with @user
  end
end

