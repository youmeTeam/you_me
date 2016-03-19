class UserSessionsController < ApplicationController
  skip_before_filter :require_login, only: [:index, :new, :create, :destroy]

  def index
    @user = User.new
  end

  def new
    @user = User.new
  end

  def create
    if @user = login(params[:email], params[:password], params[:remember])
      redirect_back_or_to dreams_path
    else
      flash.now[:danger] = 'Login failed'
      render new_user_session_path
    end
  end

  def destroy
    remember_me!
    forget_me!
    logout
    redirect_to root_url, info: 'Logged out!'
  end
end
