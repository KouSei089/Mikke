class ApplicationController < ActionController::Base
  before_action :require_login

  protected

    def not_authenticated
      redirect_to new_initial_url
    end
end
