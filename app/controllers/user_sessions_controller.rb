class UserSessionsController < ApplicationController
  skip_before_filter :require_login, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    if @user = login(params[:email], params[:password])
      redirect_back_or_to :users, notice: 'Login successful'
    else
      flash.now[:alert] = 'Login failed'
      render new_user_session_path
    end
  end

  def destroy
    logout
    redirect_to :users, notice: 'Logged out!'
  end
end
