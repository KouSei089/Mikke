class SoliloquiesController < ApplicationController
  before_action :set_soliloquy, only: [:edit, :update, :destroy]

  def new
    @soliloquy = Soliloquy.new
  end

  def create
    soliloquy = current_user.soliloquies.build(soliloquy_params)
    soliloquy.emotion_point = soliloquy.sentiment_score
    if soliloquy.save
      redirect_to root_url, notice: 'つぶやきしました。'
    else
      flash.now[:alert] = '空白項目があります。'
      render :new
    end
  end

  def edit; end

  def update
    if @soliloquy.update(soliloquy_params)
      redirect_to root_url, notice: 'つぶやきを編集しました.'
    else
      render :edit
    end
  end

  def destroy
    @soliloquy.destroy!
    redirect_to root_url, notice: 'つぶやきを削除しました.'
  end

  private

    def soliloquy_params
      params.require(:soliloquy).permit(:text, :emotion_point)
    end

    def set_soliloquy
      @soliloquy = current_user.soliloquies.find(params[:id])
    end
end
