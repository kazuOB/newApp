class AddWordNumToTest2s < ActiveRecord::Migration[5.1]
  def change
    add_column :test2s, :word_num, :decimal
  end
end
