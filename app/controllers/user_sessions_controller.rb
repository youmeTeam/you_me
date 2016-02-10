class UserSessionsController < ApplicationController
  skip_before_filter :require_login, only: [:create]

  def index
  end

  def new
  end

  def create
    # TODO: 遷移先をタイムライン画面に変更する
    if @user = login(params[:email], params[:password], params[:remember])
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
end
