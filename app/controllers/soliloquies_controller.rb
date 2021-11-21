class SoliloquiesController < ApplicationController
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

  def edit
    @soliloquy = current_user.soliloquies.build(soliloquy_params)
  end

  def update
    soliloquy = current_user.soliloquies.build(soliloquy_params)
    soliloquy.update!(soliloquy_params)
    redirect_to root_url, notice: 'つぶやきを編集しました.'
  end

  def destroy
    soliloquy = current_user.soliloquies.build(soliloquy_params)
    soliloquy.destroy!
    redirect_to root_url, notice: 'つぶやきを削除しました.'
  end

  private

    def soliloquy_params
      params.require(:soliloquy).permit(:text)
    end
end
