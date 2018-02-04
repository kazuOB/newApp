class AddEndDatetimeToTest2s < ActiveRecord::Migration[5.1]
  def change
    add_column :test2s, :end_datetime, :datetime
  end
end
