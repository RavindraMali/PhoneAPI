class PhoneController < ApplicationController
    skip_before_action :verify_authenticity_token
    def index
        @listPhoneNumber = AllocatedPhoneNumber.all
        if @listPhoneNumber.present?
            render json: { success: true, message: "List of allocated phone numbers.", phone_numbers: @listPhoneNumber.pluck(:PhoneNumber)}, status: 200
        else
            render json: { success: true, message: "Not Found allocated phone numbers.", phone_numbers: @listPhoneNumber.pluck(:PhoneNumber)}, status: 200
        end
    rescue => exception
        render json: { success: false, errors: exception.message}, status: 400
    end

    def create
        phone_number = params[:PhoneNumber]
        if phone_number.present?
            phone_number = phone_number.gsub('/-/',"")
            check_existance = AllocatedPhoneNumber.where(PhoneNumber: phone_number)
            if check_existance.present?
                random_number = AllocatedPhoneNumber.get_random_number
                result = AllocatedPhoneNumber.create(PhoneNumber: random_number)
                render json:{success: true, message: "Sorry #{phone_number} is not available,  New phone number allocated Successfully.", phone_number: result.PhoneNumber}, status: 200
            else
                result = AllocatedPhoneNumber.new({PhoneNumber: phone_number})
                if result.save
                    str =  result.PhoneNumber;
                    [4, 7].each { |i| str.insert i, '-' }
                  render json: {success: true, message: "The special number is allocated", phone_number: str}, status: 200
                else
                  render json: {success: false, error: result.errors}, status: 500 
                end
            end
        else
            random_number = AllocatedPhoneNumber.get_random_number
            result = AllocatedPhoneNumber.create(PhoneNumber: random_number)
            str =  result.PhoneNumber;
                  [4, 7].each { |i| str.insert i, '-' } 
            render json:{success: true, message: "New phone number allocated Successfully.", phone_number: str}, status: 200
        end
        
    end

    def phone_params
        params.require(:phone).permit(:PhoneNumber)
    end
end
