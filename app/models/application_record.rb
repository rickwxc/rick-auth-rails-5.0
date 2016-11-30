class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.ar_save_load(data, load_keys)
	  kv = {}

	  if load_keys
		  load_keys.each do |k|
			  kv[k] = data[k]
		  end
	  else
		  kv = data
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
