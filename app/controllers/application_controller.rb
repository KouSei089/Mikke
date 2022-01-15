class ApplicationController < ActionController::Base
  before_action :require_login

  protected

    def not_authenticated
      redirect_to main_app.new_initial_url
    end
end
