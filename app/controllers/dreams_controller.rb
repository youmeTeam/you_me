class DreamsController < ApplicationController

  # GET /dream.json
  def index
    @dream = Dream.new
    @dreams = Dream.all.page(params[:page])
    render
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
