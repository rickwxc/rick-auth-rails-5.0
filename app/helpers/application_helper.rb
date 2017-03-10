module ApplicationHelper

	def dump_json(o, sp)
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
		rs = []
		o.each do |k, v|
			s = s + k.to_s + ': '
			s = s + v.to_s
			rs << (k.to_s + ': ' + v.to_s) 
			#s = s + '<br />'
		end

		rs.join(sp)
	end

end
