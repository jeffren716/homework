class SessionsController < ApplicationController
  # before_action :require_logged_in, only: [:destroy]
  # before_action :require_logged_out, only: [:new, :create]

  def new
    render :new
  end

  def create
    user = User.find_by_credentials(
      params[:user][:email],
      params[:user][:password]
    )
    if user.nil?
      flash.now[:errors] = ["Invalid email or password"]
      render :new
    else
      log_in_user!(user)
      redirect_to user_url(user)
    end
  end

  def destroy
    log_out_user!
    redirect_to new_session_url
  end

end
