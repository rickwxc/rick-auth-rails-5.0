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

	def au_date_full(dt)
		Time.zone = 'Sydney'

		local_dt = Time.zone.at(dt.to_i)
		s = local_dt.strftime('%H:%M, %e/%b/%Y')

		s
	end

end
