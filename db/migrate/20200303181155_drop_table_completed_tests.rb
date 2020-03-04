class DropTableCompletedTests < ActiveRecord::Migration[6.0]
  def up
    drop_table :completed_tests, if_exists: true
  end
end
