class CreateOperationAttributes < ActiveRecord::Migration[7.0]
  def change
    create_table :operation_attributes do |t|
      t.string :name
      t.string :values
      t.belongs_to :operation, null: true, foreign_key: true

      t.timestamps
    end
  end
end
