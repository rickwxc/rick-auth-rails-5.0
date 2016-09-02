class Position < ApplicationRecord
	has_many :position2permissions
	has_many :permissions, through: :position2permissions
end
