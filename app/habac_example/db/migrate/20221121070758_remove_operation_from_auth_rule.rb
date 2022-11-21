class RemoveOperationFromAuthRule < ActiveRecord::Migration[7.0]
  def change
    remove_column :auth_rules, :operation_id
  end
end
