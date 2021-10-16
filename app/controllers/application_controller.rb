class ApplicationController < ActionController::Base
  before_action :require_login

  private

  def not_authenticated
    redirect_to new_initials_path, alert: "Please login first"
  end
end
