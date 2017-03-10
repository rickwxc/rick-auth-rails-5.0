module ApplicationHelper

	def dump_json(o)
		if !o 
			return ''
		end

		if o.class.name == 'String'
			begin
				o = JSON.parse o
			rescue JSON::ParserError => e
				return o
			end
		end
		s = ''
		o.each do |k, v|
			s = s + k.to_s + ': '
			s = s + v.to_s
			s = s + '<br />'
		end

		s
	end

end
