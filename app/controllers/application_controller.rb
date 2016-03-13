class ApplicationController < ActionController::Base
  before_action :require_login
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private
    def not_authenticated
      redirect_to new_user_session_path, flash: { info: 'Please login first' }
    end
end
