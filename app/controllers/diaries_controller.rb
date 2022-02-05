class DiariesController < ApplicationController
  before_action :set_diary, only: [:show, :edit, :update, :destroy]
  before_action :set_trivia, only: [:create, :update]

  def index
    @diaries = current_user.diaries.paginate(page: params[:page], per_page: 10).order(created_at: :desc)
    @diaries_sentiments = current_user.diaries.all.order(created_at: :desc).limit(5)
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
      redirect_to trivium_url(@trivia), notice: "筆記開示を登録しました。"
    else
      flash.now[:alert] = "空白項目があります。"
      render :new
    end
  end

  def sentiment_confirm
    @diary = Diary.find_or_initialize_by(id: params[:id])
    @diary.assign_attributes(diary_params)
    @sentiments_date = Sentiment.all.map(&:name)
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
      params.require(:diary).permit(:title, :text, :creativity, :emotion_point, { sentiment_ids: [] })
    end

    def set_diary
      @diary = current_user.diaries.find(params[:id])
    end

    def set_trivia
      @trivia = Trivia.find(rand(Trivia.first.id..Trivia.last.id))
    end
end
