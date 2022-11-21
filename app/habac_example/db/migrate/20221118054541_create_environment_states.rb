class CreateEnvironmentStates < ActiveRecord::Migration[7.0]
  def change
    create_table :environment_states do |t|
      t.string :name

      t.timestamps
    end
  end
end
