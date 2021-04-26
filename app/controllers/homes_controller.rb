class HomesController < ApplicationController
    skip_before_action :authorized, only: [:new_student, :new_teacher, :create, :welcome]
    def new_student
    end

    def new_teacher
    end

    def login_student
        puts "Login Page is called for student" 
        @user = Student.find_by(email_id: params[:email_id])  
        puts @user.first_name 
        if @user && @user.authenticate(params[:password])      
            session[:student_id] = @user.id      
            #redirect_to '/show'
            redirect_to '/students/show'   
        else      
            redirect_to '/login_student'
        end
    end
    
    # def create    
    # end

    def welcome
    end
    def exit
    end

    def login_teacher
        puts "Login Page is called for teacher"
        @user = Teacher.find_by(email_id: params[:email_id])  
        puts @user.first_name 
        if @user && @user.authenticate(params[:password])      
            session[:teacher_id] = @user.id      
            #redirect_to '/show'
            redirect_to '/teachers/show'   
        else      
            redirect_to '/login_teacher'
        end
    end

    def logout_student
        puts "Destroy method is called"
        #Student.find(session[:student_id]).destroy
        #session.delete(:student_id)
        session[:student_id] = nil
        redirect_to '/homes/logout'
    end
end
