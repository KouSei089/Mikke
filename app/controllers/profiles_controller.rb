class ProfilesController < ApplicationController
  def edit
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(current_user.id)
    if @user.update(user_params)
      redirect_to settings_path, notice: '変更完了'
    else
      flash.now[:alert] = '漏れてます'
      render :edit
    end
  end

  private

    def user_params
      params.require(:user).permit(:username)
    end
end
