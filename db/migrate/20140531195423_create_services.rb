class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :name
      t.string :group
      t.string :jira
      t.string :confluence

      t.timestamps
    end
  end
end
