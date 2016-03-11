class ActivationController < ApplicationController
  skip_before_filter :require_login, only: [:activate]

  def activate
  end
end
