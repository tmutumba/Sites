class AdminUser < ApplicationRecord

	has_and_belongs_to_manys :pages
	has_many :section_edits
end
