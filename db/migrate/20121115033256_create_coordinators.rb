class CreateCoordinators < ActiveRecord::Migration
  def change
    create_table :coordinators do |t|
      t.string :first, :limit => 40
      t.string :last, :limit => 40
      t.integer :contact_info_id, :null => false

      t.timestamps
    end
  end
end
