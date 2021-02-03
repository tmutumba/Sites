class SectionEdit < ApplicationRecord

	belongs_to :admin_user, :class_name => "AdminUser", :foreign_key => "admin_user_id" 
	belongs_to :section
end
