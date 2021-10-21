class SoliloquiesController < ApplicationController
  def new
    @soliloquy = Soliloquy.new
  end

  def create
    soliloquy = Soliloquy.new(soliloquy_params)
    if soliloquy.save
      redirect_to root_path, notice: 'つぶやきしました。'
    else
      flash.now[:alert] = '空白項目があります。'
      render :new
    end
  end

  def edit; end

  private

    def soliloquy_params
      params.require(:soliloquy).permit(:soliloquy)
    end
end
