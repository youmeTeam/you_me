class UserMailer < ApplicationMailer

  def activation_needed_email(user)
    @user = user
    @url = "http://0.0.0.0:3000/users/#{@user.activation_token}/activate"

    mail to: @user.email, subject: 'Dreamerアカウントを確認してください'
  end

  def activation_success_email(user)
    @user = user
    @url = 'http://0.0.0.0:3000/user_sessions/new'

    mail to: @user.email, subject: 'アカウントが有効になりました'
  end

  def reset_password_email(user)
    @user = User.find user.id
    @url = edit_password_reset_url(@user.reset_password_token)

    mail to: @user.email, subject: 'パスワードがリセットされました'
  end
end
