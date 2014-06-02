class CreateEndpoints < ActiveRecord::Migration
  def change
    create_table :endpoints do |t|
      t.string :name
      t.string :description
      t.string :endpoint_type
      t.string :url
      t.belongs_to :instance, index: true

      t.timestamps
    end
  end
end
