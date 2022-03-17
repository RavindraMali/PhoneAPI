class PhoneController < ApplicationController

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
    end
end
