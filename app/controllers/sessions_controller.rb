class SessionsController < Devise::SessionsController
    def new
        super
    end

    def create
        puts 'Mine session controller is called'
        self.resource = warden.authenticate!(auth_options)
        set_flash_message!(:notice, :signed_in)
        sign_in(resource_name, resource)
        @user = User.find(current_user.id)
        if @user.role=="Student"
            redirect_to exam_portal_path
        else
            redirect_to report_portal_path
        end
    end
end