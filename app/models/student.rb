class Student < ApplicationRecord
    has_secure_password
    #params.require(:student).permit(:first_name,:last_name,:email_id,:password_digest)
    validates :email_id, presence: true, uniqueness: true
    validates :password, presence: true
end
