class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  #try load first, if not found save it 
  #data: Hash {}
  #load_keys: Array []
  def self.ar_save_load(arg_data, load_keys)
	  data = {}

	  arg_data.each do |k,v|
		  if v.respond_to?('strip')
			  data[k] = v.strip
		  else
			  data[k] = v
		  end
	  end

	  kv = {}

	  data.each do |k,v|
		  if load_keys
			  if load_keys.include? k
				  kv[k] = v
			  end
		  else
			  kv[k] = v 
		  end
	  end

	  obj = self.find_or_initialize_by(kv)

	  if load_keys
		  data.each do |k,v|
			  if obj.has_attribute?(k) 
				  obj[k] = v
			  end
		  end
	  end

	  obj.save

	  obj
  end

end
