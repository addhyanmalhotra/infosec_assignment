class CreateUserAttributes < ActiveRecord::Migration[7.0]
  def change
    create_table :user_attributes do |t|
      t.belongs_to :user, null: true, foreign_key: true
      t.string :name
      t.string :values

      t.timestamps
    end
  end
end
