class AddIsFirstToMilestone < ActiveRecord::Migration
  def change
    add_column :milestones, :is_first, :boolean
  end
end
