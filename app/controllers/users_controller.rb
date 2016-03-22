class UsersController < ApplicationController
  skip_before_filter :require_login, only: [:index, :new, :create, :activate]
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    @user.user_name = @user.email.match(/\A[\w+\-.]+@/).to_s.chop
    respond_to do |format|
      if @user.save
        format.html { redirect_to activation_index_path }
        format.js { render js: "window.location = '#{activation_index_path}'", success: 'User was successfully created.' }
      else
        format.json { render json: { errors: @user.errors.full_messages }, status: 422 }
        format.html { redirect_to new_user_path }
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, success: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, success: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def activate
    if @user = User.load_from_activation_token(params[:id])
      @user.activate!
      redirect_to new_user_session_path, flash: { success: 'アカウントが確認されました。ログインしてください。'}
    else
      not_authenticated
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :password, :nickname)
    end
end
