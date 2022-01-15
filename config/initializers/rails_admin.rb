RailsAdmin.config do |config|
  config.authenticate_with do
    # Use sorcery's before filter to auth users
    require_login

    redirect_to root_path unless current_user.admin?
  end
  config.current_user_method(&:current_user)

  ## == CancanCan ==
  config.authorize_with :cancancan

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app
  end
  config.parent_controller = 'ApplicationController'
end
