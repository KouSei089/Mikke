class AnalysesController < ApplicationController
  def show
    @diaries = current_user.diaries.all
    @diaries_score = @diaries.group_by_day(:created_at, last: 7).average(:emotion_point)
    gon.chartdays = @diaries_score.map(&:first)
    chartdates = @diaries_score.map(&:second)
    negatives = @diaries_score.map(&:second)
    gon.positive_scores = chartdates.map do |score|
      if score.nil? || score.negative?
        _positive_score = 0.05
      elsif score.positive?
        _positive_score = score
      else
        score
      end
    end
    gon.negative_scores = negatives.map do |score|
      if score.nil? || score.positive?
        _negative_score = -0.05
      elsif score.negative?
        _negative_score = score
      else
        score
      end
    end
  end
end
