class Page < ApplicationRecord

	belongs_to :subject
	has_and_belongs_to_manys :editors, :class_name => "AdminUser"

end
