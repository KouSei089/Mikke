class DiariesController < ApplicationController
  def index
    diaries = current_user.diaries.all
    soliloquies = current_user.soliloquies.all
    @diaries_created = diaries | soliloquies
    @diaries_created.sort! { |a, b| b.created_at <=> a.created_at }
  end

  def new
    @diary = Diary.new
  end

  def create
    diary = current_user.diaries.build(diary_params)
    diary.creativity = diary.text.length / 5
    diary.emotion_point = diary.sentiment_score
    if diary.save
      redirect_to root_url, notice: "筆記開示を登録しました。"
    else
      flash.now[:alert] = "空白項目があります。"
      render :new
    end
  end

  def show
    @diary = current_user.diaries.find(params[:id])
  end

  def edit
    @diary = current_user.diaries.find(params[:id])
  end

  def update
    diary = current_user.diaries.find(params[:id])
    diary.creativity = diary.text.length / 5
    diary.word_count = diary.text.length
    diary.emotion_point = diary.sentiment_score
    diary.update!(diary_params)
    redirect_to root_url, notice: "筆記開示を編集しました。"
  end

  def destroy
    diary = current_user.diaries.find(params[:id])
    diary.destroy
    redirect_to root_url, alert: "筆記開示を削除しました。"
  end

  private

    def diary_params
      params.require(:diary).permit(:title, :text, :creativity, :emotion_point)
    end
end
