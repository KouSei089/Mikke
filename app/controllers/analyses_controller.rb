class AnalysesController < ApplicationController
  def show
    gon.chartdays = Diary.group_by_day(:created_at, last: 7).average(:emotion_point).map(&:first)
    @positives = current_user.diaries.group_by_day(:created_at, last: 7).average(:emotion_point).map(&:second)
    @negatives = current_user.diaries.group_by_day(:created_at, last: 7).average(:emotion_point).map(&:second)
    gon.positive_scores = positive_analyses
    gon.negative_scores = negative_analyses
    gon.creative_days = current_user.diaries.pluck(:created_at).map { |creative_day| creative_day.strftime("%m/%d\n%H:%S") }
    gon.creative_sizes = current_user.diaries.pluck(:creativity)
  end

  private

    def positive_analyses
      @positives.map do |score|
        if score.nil? || score.negative?
          _positive_score = 0.05
        elsif score.positive?
          _positive_score = score
        else
          score
        end
      end
    end

    def negative_analyses
      @negatives.map do |score|
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
