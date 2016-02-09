class UserSessionsController < ApplicationController
  skip_before_filter :require_login, only: [:new, :create]

  def index
  end

  def new
    @user = User.new
  end

  def create
    if @user = login(session_params)
      redirect_back_or_to users_path, notice: 'Login successful'
    else
      flash.now[:alert] = 'Login failed'
      render new_user_session_path
    end
  end

  def destroy
    logout
    redirect_to root_url, notice: 'Logged out!'
  end

  private
    def session_params
      params.require(:session).permit(:email, :password, :remember_me)
    end
end
