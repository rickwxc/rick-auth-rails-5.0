class AuthTag2obj < ApplicationRecord

	def self.get_tag_ids(id, model)
		rs  =  self.get_tag(id, model)
		rs.collect!{|t| t.id}
		rs
	end

	def self.get_tag(id, model)
		rs = AuthTag.find_by_sql "select t.* from auth_tags t join auth_tag2objs o on t.id = o.auth_tag_id and o.auth_obj_id = #{id} and o.model = '#{model}'"
	end

end
