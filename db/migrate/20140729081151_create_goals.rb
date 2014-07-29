class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.integer :value
      t.references :type, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
