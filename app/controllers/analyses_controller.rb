class AnalysesController < ApplicationController
  def show
    @diaries = current_user.diaries.all
    @diaries_score = @diaries.group_by_day(:created_at, last: 7).average(:emotion_point)
    gon.chartdays = @diaries_score.map(&:first)
    gon.chartdates = @diaries_score.map(&:second)
  end
end
