class Profile < ApplicationRecord
  belongs_to :user
  has_attached_file :avatar, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  }

  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  #create if not exit
  def self.get_profile(user_id)
	p  = Profile.where(:user_id => user_id).first

	unless p
		p = Profile.create(
			user_id: user_id
		)
	end

	p
  end

end
