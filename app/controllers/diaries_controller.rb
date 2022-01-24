class DiariesController < ApplicationController
  before_action :set_diary, only: [:show, :edit, :update, :destroy]

  def index
    @diaries = current_user.diaries.all.order(created_at: :desc)
    @soliloquies = current_user.soliloquies.all.order(created_at: :desc)
    @diaries_created = @diaries | @soliloquies
    @diaries_created.sort! { |a, b| b.created_at <=> a.created_at }
  end

  def new
    @diary = Diary.new
  end

  def create
    @diary = current_user.diaries.build(diary_params)
    @diary.data_create_logic
    if @diary.save
      redirect_to root_url, notice: "筆記開示を登録しました。"
    else
      flash.now[:alert] = "空白項目があります。"
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    @diary.data_create_logic
    if @diary.update(diary_params)
      redirect_to root_url, notice: "筆記開示を編集しました。"
    else
      render :edit
    end
  end

  def destroy
    @diary.destroy
    redirect_to root_url, alert: "筆記開示を削除しました。"
  end

  private

    def diary_params
      params.require(:diary).permit(:title, :text, :creativity, :emotion_point)
    end

    def set_diary
      @diary = current_user.diaries.find(params[:id])
    end
end
