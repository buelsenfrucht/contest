class CreateMilestones < ActiveRecord::Migration
  def change
    create_table :milestones do |t|
      t.date :achieved_at
      t.integer :value
      t.references :type, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
