class CreateCorpus < ActiveRecord::Migration[6.1]
  def change
    create_table :corpus do |t|
      t.string :question
      t.string :answer

      t.timestamps
    end
  end
end
