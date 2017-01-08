class AuthOrder < ApplicationRecord
	belongs_to:auth_orderst
	belongs_to:auth_payst
end
