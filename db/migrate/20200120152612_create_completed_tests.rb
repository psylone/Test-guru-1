class CreateCompletedTests < ActiveRecord::Migration[6.0]
  def change
    create_table :completed_tests do |t|
      
      t.timestamps
    end
  end
end
