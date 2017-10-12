class SessionsController < ApplicationController

  def create
    if params[:provider].present?
      @user = User.find_or_create_from_auth(request.env['omniauth.auth'])
      set_session_user_id
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

  private

  def set_session_user_id
    if @user
      session[:user_id] = @user.id
      flash[:notice] = "Logged in as #{@user.name}"
      redirect_to user_path(current_user)
    end
  end


end
