class RegulationsController < ApplicationController
  skip_before_action :require_login, only: [:terms, :privacy]

  def terms; end

  def privacy; end
end
