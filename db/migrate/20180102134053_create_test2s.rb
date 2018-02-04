class CreateTest2s < ActiveRecord::Migration[5.1]
  def change
    create_table :test2s do |t|
      t.decimal :test_num
      t.string :word
      t.string :answer1
      t.string :answer2
      t.string :answer3
      t.string :answer4
      t.string :answer5
      t.string :answer6
      t.string :answer7
      t.string :answer8
      t.string :answer9
      t.string :answer10
      t.string :user_answer
      t.string :right_answer

      t.timestamps
    end
  end
end
