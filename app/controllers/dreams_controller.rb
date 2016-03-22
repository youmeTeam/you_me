class DreamsController < ApplicationController

  def index
    @dream = current_user.dreams.new
    @dreams = current_user.dreams.order(created_at: :desc).page(params[:page])
  end

  def create
    @dream = current_user.dreams.build(dream_params)
    if @dream.save
      redirect_to dreams_path
    else
      redirect_to root_path, flash: { danger: '投稿に失敗しました' }
    end
  end

  private

    def dream_params
      params.require(:dream).permit(:content)
    end
end
