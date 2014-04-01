class AddTargetTypeToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :target_type, :string
    add_column :activities, :target_id, :integer
    add_column :activities, :actor_id, :integer
  end
end
