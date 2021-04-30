class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    helper_method :current_user, :signed_id?
    before_action :configure_permitted_parameters, if: :devise_controller?

    def signed_in?
        !!current_user
    end

    def authenticate_user!
    end
    
    protected

        def configure_permitted_parameters
            devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name, :last_name, :email, :password, :role)}
            devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:first_name, :last_name, :email, :password, :current_password)}
        end
end
