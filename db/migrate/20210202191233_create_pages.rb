class CreatePages < ActiveRecord::Migration[6.1]
  def up
    create_table :pages do |t|
    	#t.references :subject
    	t.integer "subject_id"
    	t.string "name", :limit => 25
    	t.string "permalink"
    	t.integer "position"
    	t.boolean "visible", :default => false
    	#add_column :subjects, :subject_id, :integer
      	t.timestamps
    end
    add_index("pages", "subject_id")
    add_index("pages", "permalink")
  end

  def down
  		#remove_column :subjects, :subject_id, :integer
  		drop_table "pages" 
  end

end
