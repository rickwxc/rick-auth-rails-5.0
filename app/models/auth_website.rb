class AuthWebsite < ApplicationRecord

	def nav_tags
		rs = AuthTag.find_by_sql "select t.* from auth_tags t join auth_website2tags wt on t.id = wt.auth_tag_id and wt.auth_website_id = #{self.id}"

		rs
	end

end
