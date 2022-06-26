class CreateSystemOperationLogs < ActiveRecord::Migration[7.0]
  def change
    create_table :system_operation_logs do |t|
      t.integer :user_id
      t.string :message

      t.timestamps
    end
  end
end
