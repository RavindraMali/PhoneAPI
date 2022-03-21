class AllocatedPhoneNumber < ApplicationRecord

	validates :PhoneNumber, presence: true, format: { with: /\A\d+\z/, message: "Integer only. No sign allowed." }
	validates_format_of :PhoneNumber, :with => /[\d\-]{9,14}/, :message => "Phone number must contain only 10 digits"
	validate :check_number_range

    #validate range of phone number
    def check_number_range
    	number = self.PhoneNumber.gsub(/-/,"")
        if number.to_i < 1111111111 || number.to_i > 9999999999
            errors.add(:phoneNumber, "should be in the range from 111-111-1111 to 999-999-9999")
        end
    end


    def self.get_random_number
		begin
			random = rand(1111111111..9999999999)
			existing = self.where(PhoneNumber: random)
		end while existing.present?
		random
	end
end	
