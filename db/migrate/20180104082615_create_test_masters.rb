class CreateTestMasters < ActiveRecord::Migration[5.1]
  def change
    create_table :test_masters do |t|
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
      t.string :right_answer

      t.timestamps
    end
  end
end
