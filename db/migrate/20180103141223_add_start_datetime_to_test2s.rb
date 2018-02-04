class AddStartDatetimeToTest2s < ActiveRecord::Migration[5.1]
  def change
    add_column :test2s, :start_datetime, :datetime
  end
end
