class UserSessionsController < ApplicationController
  skip_before_filter :require_login, only: [:create]

  def index
  end

  def new
    @user = User.new
  end

  def create
    # TODO: 遷移先をタイムライン画面に変更する
    if @user = login(params[:email], params[:password], params[:remember])
      redirect_back_or_to users_path, success: 'Login successful'
    else
      flash.now[:danger] = 'Login failed'
      render new_user_session_path
    end
  end

  def destroy
    logout
    redirect_to root_url, info: 'Logged out!'
  end
end
