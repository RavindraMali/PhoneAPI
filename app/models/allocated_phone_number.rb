class AllocatedPhoneNumber < ApplicationRecord

	validates :PhoneNumber, presence: true, format: { with: /\A\d+\z/, message: "Integer only. No sign allowed." }
	validates_format_of :PhoneNumber, :with => /[\d\-]{9,14}/, :message => "Phone number must contain only 10 digits"
	


    def self.get_random_number
		begin
			random = rand(1111111111..9999999999)
			existing = self.where(PhoneNumber: random)
		end while existing.present?
	
		random
	end
end
