class CreateStudents < ActiveRecord::Migration[6.1]
  def change
    create_table :students do |t|
      t.integer :roll_no, unique=true
      t.string :first_name
      t.string :last_name
      t.string :email_id, unique=true
      t.string :password_digest
      t.integer :score

      t.timestamps
    end
  end
end
