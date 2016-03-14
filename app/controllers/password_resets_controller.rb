class PasswordResetsController < ApplicationController
  skip_before_filter :require_login

  def new

  end

  def create
    if @user = User.find_by_email(params[:email])
      @user.deliver_reset_password_instructions!
      render js: "window.location = '#{ sent_password_resets_path }'", flash: { info: 'パスワード再設定メールを送信しました' }
    elsif params[:email].blank?
      render json: { errors: 'メールアドレスを入力してください' }
    else
      render json: { errors: '入力したメールアドレスは登録されていません'}
    end
  end

  def edit
    @token = params[:id]
    @user = User.load_from_reset_password_token(params[:id])

    if @user.blank?
      not_authenticated
    end
  end

  def update
    @token = params[:id]
    @user = User.load_from_reset_password_token(params[:id])

    if @user.blank?
      not_authenticated
    end

    @user.password_confirmation

    if @user.change_password!(params[:user][:password])
      redirect_to new_user_session_path, flash: { success: 'パスワードの変更に成功しました。'}
    else
      render action: 'edit'
    end
  end
end
