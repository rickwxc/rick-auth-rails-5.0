class AuthTag < ApplicationRecord
	has_many:auth_tag2objs

	def self.nav_tags
		#rs = AuthTag.where(:auth_tagtype_id => AuthTagtype::Nav)
		rs = []

		rs
	end

	def self.nav_tags_tree

	end

	def get_webroot_ids
		rs = AuthWebsite2tag.where(:auth_tag_id => self.id)
		l = rs.collect{|t| t.auth_website_id}

		l
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

	def self.get_discount(obj)
		obj_tag_ids = AuthTag2obj.get_tag_ids(obj.id, obj.class.name)
		all_tag_ids = self.get_all_parents_ids(obj_tag_ids)

		d = AuthDiscount.where("model =? and obj_id in (?)", self.name, all_tag_ids).order('amt asc').first

		d
	end

	def self.get_all_parents_ids(ids)
		if ids.length == 0 
			return []
		end

		c1 = ids.count

		c2 = 0
		while (c1 != c2)

			c1 = ids.length

			rs = AuthTag2tag.where("ctag_id in (?)", ids)
			rs = rs.collect{|t| t.ptag_id}
			(ids << rs).flatten!
			ids.uniq!
			c2 = ids.length
		end

		ids
	end

end
