class CreateRepositories < ActiveRecord::Migration
  def change
    create_table :repositories do |t|
      t.string :description
      t.string :url
      t.belongs_to :service, index: true

      t.timestamps
    end
  end
end
