class CreateInstances < ActiveRecord::Migration
  def change
    create_table :instances do |t|
      t.string :name
      t.string :version_of_artifact
      t.string :description
      t.belongs_to :service, index: true

      t.timestamps
    end
  end
end
