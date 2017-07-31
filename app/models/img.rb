class Img < ApplicationRecord


  has_attached_file :file, styles: {
    thumb: '100x100>',
    medium: '400x400>',
    large: '1024x1024>',

    square100: '100x100#',
    square200: '200x200#',
    square400: '400x400#',

    rec64_small: '300x200#',
    rec64_medium: '600x400#',
    rec64_large: '1200x800#',

    rec169_small: '320x180#',
    rec169_medium: '640x360#',
    rec169_large: '1280x720#',
  }

  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :file, :content_type => /\Aimage\/.*\Z/


  def self.load_imgs(modelname, uuid)
	  rs = Img.where(:modelname => modelname, :uuid => uuid).order('idx asc')

	  rs
  end

end
