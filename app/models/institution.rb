class Institution < ApplicationRecord
	has_many :pitches
	has_many :contacts
end
