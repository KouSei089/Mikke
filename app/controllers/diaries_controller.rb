class DiariesController < ApplicationController
  def index
    @diaries = Diary.all
  end

  def new
    @diary = Diary.new
  end

  def create
    diary = Diary.new(diary_params)
    diary.save!
    redirect_to root_path, notice: "筆記開示を登録しました。"
  end

  private

  def diary_params
    params.require(:diary).permit(:title, :text)
  end
end
