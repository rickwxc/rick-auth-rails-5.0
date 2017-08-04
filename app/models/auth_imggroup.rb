class AuthImggroup < ApplicationRecord

  def self.load_imgs(model, obj_id, acckey)

	  type = AuthImggroupType.where(:acckey => acckey).first
	  if !type
		  return nil
	  end

	  gp = AuthImggroup.where(:model => model, :obj_id => obj_id, :auth_imggroup_type_id => type.id).first
	  if !gp
		  return nil
	  end


	  rs = Img.where(:modelname => gp.class.name, :uuid => gp.id).order('idx asc').first(gp.maximg.to_i)

	  rs
  end
end
