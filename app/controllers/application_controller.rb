class ApplicationController < ActionController::Base
    before_action :authorized
    helper_method :current_user
    helper_method :logged_in?

    def current_user
        if session[:student_id]
            @user = Student.find(session[:student_id])
        end
    end
    def logged_in?  
        !!current_user 
    end
    def authorized
        redirect_to '/welcome' unless logged_in? | logout_path
    end
end
