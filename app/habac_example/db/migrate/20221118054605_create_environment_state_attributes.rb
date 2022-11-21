class CreateEnvironmentStateAttributes < ActiveRecord::Migration[7.0]
  def change
    create_table :environment_state_attributes do |t|
      t.string :name
      t.string :values
      t.belongs_to :environment_state, null: true, foreign_key: true

      t.timestamps
    end
  end
end
