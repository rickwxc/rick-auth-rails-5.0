module ApplicationHelper

	def dump_json(o)
		s = ''
		o.each do |k, v|
			s = s + k.to_s + ': '
			s = s + v.to_s
		end

		s
	end

end
