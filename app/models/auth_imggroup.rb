class AuthImggroup < ApplicationRecord
	belongs_to:auth_imggroup_type

  def self.load_imgs(model, obj_id, acckey)

	  type = AuthImggroupType.where(:acckey => acckey).first
	  if !type
		  return []
	  end

	  gp = AuthImggroup.where(:model => model, :obj_id => obj_id, :auth_imggroup_type_id => type.id).first
	  if !gp
		  return []
	  end


	  rs = Img.where(:modelname => gp.class.name, :uuid => gp.id).order('idx asc').first(gp.maximg.to_i)

	  rs
  end
end
