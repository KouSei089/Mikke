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
    @diaries_creative = current_user.diaries.pluck(:created_at, :creativity)
    gon.creative_days = @diaries_creative.map { |creative_day| creative_day[0].strftime("%m/%d\n%H:%S") }
    gon.creative_sizes = @diaries_creative.map(&:second)
  end
end
