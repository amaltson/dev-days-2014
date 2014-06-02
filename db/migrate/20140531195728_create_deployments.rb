class CreateDeployments < ActiveRecord::Migration
  def change
    create_table :deployments do |t|
      t.string :name
      t.string :description
      t.string :url
      t.belongs_to :service, index: true

      t.timestamps
    end
  end
end
