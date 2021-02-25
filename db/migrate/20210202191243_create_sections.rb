class CreateSections < ActiveRecord::Migration[6.1]
  def up
    create_table :sections do |t|
    	t.integer "page_id"
    	t.column "name", :string, :limit => 25
    	t.integer "position"
    	t.boolean "visible", :default => false
    	t.string "content_type"
    	t.text "content"
    	#add_column :pages, :pages_id, :integer
      t.timestamps
    end
    add_index("sections", "page_id")
  end

  def down
  		drop_table :sections
  end

end
