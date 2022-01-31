class DiariesController < ApplicationController
  before_action :set_diary, only: [:show, :edit, :update, :destroy]

  def index
    @diaries = Diary.paginate(page: params[:page], per_page: 10).order(created_at: :desc)
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
      redirect_to trivia_url, notice: "筆記開示を登録しました。"
    else
      flash.now[:alert] = "空白項目があります。"
      render :new
    end
  end

  def sentiment_confirm
    @diary = Diary.find_or_initialize_by(id: params[:id])
    @diary.assign_attributes(diary_params)
  end

  def show
    sentiments = @diary.sentiments
    @sentiments_date = sentiments.map { |sentiment| sentiment[:name] }
  end

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
      params.require(:diary).permit(:title, :text, :creativity, :emotion_point, { sentiment_ids: [] })
    end

    def set_diary
      @diary = current_user.diaries.find(params[:id])
    end
end
