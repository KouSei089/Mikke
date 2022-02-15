class ApplicationController < ActionController::Base
  before_action :require_login

  unless Rails.env.development?
    rescue_from Exception,                        with: :_render500
    rescue_from ActiveRecord::RecordNotFound,     with: :_render404
    rescue_from ActionController::RoutingError,   with: :_render404
  end

  def routing_error
    raise ActionController::RoutingError, params[:path]
  end

  private

    def _render404(e = nil)
      logger.info "Rendering 404 with exception: #{e.message}" if e

      if request.format.to_sym == :json
        render json: { error: '404 error' }, status: :not_found
      else
        render 'errors/404.html', status: :not_found
      end
    end

    def _render500(e = nil)
      logger.error "Rendering 500 with exception: #{e.message}" if e

      if request.format.to_sym == :json
        render json: { error: '500 error' }, status: :internal_server_error
      else
        render 'errors/500.html', status: :internal_server_error
      end
    end

  protected

    def not_authenticated
      redirect_to main_app.new_initial_url
    end
end
