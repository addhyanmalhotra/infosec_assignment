class CreateDeviceAttributes < ActiveRecord::Migration[7.0]
  def change
    create_table :device_attributes do |t|
      t.string :name
      t.string :values
      t.belongs_to :device, null: true, foreign_key: true

      t.timestamps
    end
  end
end
