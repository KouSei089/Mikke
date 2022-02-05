class ProfilesController < ApplicationController
  before_action :set_user, only: [:edit, :update]

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to root_url, notice: t('profiles.flash.notice')
    else
      render :edit
    end
  end

  private

    def user_params
      params.require(:user).permit(:username)
    end

    def set_user
      @user = User.find(current_user.id)
    end
end
