class UsersController < ApplicationController
    def exam
        @student = User.find(current_user.id)
        @assign = Corpu.all
    end

    def checker
        score = 0
        res = params[:name]
        @assign = Corpu.all
        ans = {}
        @assign.each do |a|
            ans = ans.merge({"#{a.id}" => a.answer})
        end
        res.each do |id, choice|
            if ans[id] == choice
                score += 10
            end
        end
        @student = User.find(current_user.id)
        @student.update_column(:score, score)
        redirect_to result_path
    end

    def report
        @teacher = User.find(current_user.id)
        @student = User.find_by_sql("SELECT * FROM users WHERE role='Student'")
    end

    def result
        @student = User.find(current_user.id)
        @total_questions = Corpu.all.count
    end
end
