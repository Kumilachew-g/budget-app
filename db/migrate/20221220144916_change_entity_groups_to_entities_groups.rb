class ChangeEntityGroupsToEntitiesGroups < ActiveRecord::Migration[7.0]
  def change
    rename_table :entity_groups, :entities_groups
  end
end
