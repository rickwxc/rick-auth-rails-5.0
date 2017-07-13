class AuthTag < ApplicationRecord
	belongs_to:auth_tagtype

	def self.nav_tags
		rs = AuthTag.where(:auth_tagtype_id => AuthTagtype::Nav)

		rs
	end

	def self.nav_tags_tree

	end

	def get_parent
		rs = AuthTag.find_by_sql "select t.* from auth_tags t join auth_tag2tags tt on t.id = tt.ptag_id and tt.ctag_id = #{self.id}"

		rs
	end

	def get_parent_ids
		rs = self.get_parent

		rs.collect!{|t| t.id}

		rs
	end


	def get_child
		rs = AuthTag.find_by_sql "select t.* from auth_tags t join auth_tag2tags tt on t.id = tt.ctag_id and tt.ptag_id = #{self.id}"

		rs
	end

end
