class TeachersController < ApplicationController
    skip_before_action :authorized, only: [:new, :create]
    before_action :authorized, only: [:show]
    def new
        @teacher = Teacher.new
    end
    
    def create
        @teacher = Teacher.new(user_params) 
        if @teacher.save
            puts "saved"
        else
            puts "Not Saved"
        end
  	    session[:teacher_id] = @teacher.id   
  	    redirect_to '/welcome'
    end

    def show
        @user = Teacher.find(session[:teacher_id])
    end

    def logout
        puts "Destroy Teacher method is called"
        #Student.find(session[:student_id]).destroy
        #session.delete(:student_id)
        session[:student_id] = nil
        redirect_to exit_path
    end

    private
    def user_params
        params.require(:teacher).permit(:first_name,:last_name,:email_id,:password,:password_digest)
    end
end
