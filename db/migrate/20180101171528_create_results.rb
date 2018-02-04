class CreateResults < ActiveRecord::Migration[5.1]
  def change
    create_table :results do |t|
      t.string :rank
      t.string :right_answer_num
      t.string :test_time

      t.timestamps
    end
  end
end
