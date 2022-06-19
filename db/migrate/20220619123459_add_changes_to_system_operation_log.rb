class AddChangesToSystemOperationLog < ActiveRecord::Migration[7.0]
  def change
    add_column :system_operation_logs, :changes_of_operation, :string
  end
end
