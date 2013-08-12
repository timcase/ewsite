class CreateCollages < ActiveRecord::Migration
  def change
    create_table :collages do |t|

      t.timestamps
    end
  end
end
