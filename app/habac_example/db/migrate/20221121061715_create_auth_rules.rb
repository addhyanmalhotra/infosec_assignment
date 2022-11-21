class CreateAuthRules < ActiveRecord::Migration[7.0]
  def change
    create_table :auth_rules do |t|
      t.belongs_to :operation, null: false, foreign_key: true
      t.string :ua
      t.string :uav
      t.string :da
      t.string :dav
      t.string :oa
      t.string :oav
      t.string :esa
      t.string :esav

      t.timestamps
    end
  end
end
