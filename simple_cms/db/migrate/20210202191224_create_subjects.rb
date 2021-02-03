class CreateSubjects < ActiveRecord::Migration[6.1]
  def up
    create_table :subjects do |t|
    	t.column "name", :string, :limit => 50, null: false
    	t.integer "position"
    	t.boolean "visible", :default => false

      	t.timestamps
    end
  end

  def down
  		drop_table :subjects
  end
end
