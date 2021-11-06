class SoliloquiesController < ApplicationController
  def new
    @soliloquy = Soliloquy.new
  end

  def create
    soliloquy = current_user.soliloquies.build(soliloquy_params)
    if soliloquy.save
      redirect_to root_path, notice: 'つぶやきしました。'
    else
      flash.now[:alert] = '空白項目があります。'
      render :new
    end
  end

  def edit
    @soliloquy = Soliloquy.find(params[:id])
  end

  def update
    soliloquy = Soliloquy.find(params[:id])
    soliloquy.update!(soliloquy_params)
    redirect_to root_path, notice: 'つぶやきを編集しました.'
  end

  def destroy
    soliloquy = Soliloquy.find(params[:id])
    soliloquy.destroy!
    redirect_to root_path, notice: 'つぶやきを削除しました.'
  end

  private

    def soliloquy_params
      params.require(:soliloquy).permit(:soliloquy, :diary_id)
    end
end
