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
    redirect_to root_path, notice: "筆記開示を削除しました。"
  end

  private

  def diary_params
    params.require(:diary).permit(:title, :text, :creativity)
  end
end
