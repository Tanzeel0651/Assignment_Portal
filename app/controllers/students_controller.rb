class StudentsController < ApplicationController
    skip_before_action :authorized, only: [:new, :create]
    before_action :authorized, only: [:show]
    def new
        @student = Student.new
    end
    
    def create
        @student = Student.new(user_params) 
        if @student.save
            puts "saved"
        else
            puts "Not Saved"
        end
  	    session[:student_id] = @student.id   
  	    redirect_to '/welcome'
    end

    def show
        @user = Student.find(session[:student_id])
    end

    # def logout  
    # end

    private
    def user_params
        params.require(:student).permit(:roll_no,:first_name,:last_name,:email_id,:password,:password_digest)
    end
end