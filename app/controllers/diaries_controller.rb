class DiariesController < ApplicationController
  # before_action :set_q, only: [:index, :search]

  def index
    diaries = Diary.all
    soliloquies = Soliloquy.all
    @diaries_created = diaries | soliloquies
    @diaries_created.sort! { |a, b| b.created_at <=> a.created_at }

    # ransack 検索
    # @q_diary = Diary.joins(:soliloquies).ransack(params[:q])
    # @diaries = @q_diary.result
    # @q_soliloquy = Soliloquy.ransack(params[:q])
    # @soliloquies = @q_soliloquy.result
  end

  def new
    @diary = Diary.new
  end

  def create
    diary = current_user.diaries.build(diary_params)
    diary.creativity = diary.text.length
    if diary.save
      redirect_to root_path, notice: "筆記開示を登録しました。"
    else
      flash.now[:alert] = "空白項目があります。"
      render :new
    end
  end

  def show
    @diary = Diary.find(params[:id])
  end

  def edit
    @diary = Diary.find(params[:id])
  end

  def update
    diary = Diary.find(params[:id])
    diary.update!(diary_params)
    redirect_to root_path, notice: "筆記開示を編集しました。"
  end

  def destroy
    diary = Diary.find(params[:id])
    diary.destroy
    redirect_to root_path, alert: "筆記開示を削除しました。"
  end

  private

    def diary_params
      params.require(:diary).permit(:title, :text, :creativity)
    end
end
